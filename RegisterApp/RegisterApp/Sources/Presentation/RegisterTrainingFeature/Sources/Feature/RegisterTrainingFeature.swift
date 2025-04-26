// The Swift Programming Language
// https://docs.swift.org/swift-book

import ComposableArchitecture
import Domain
import Composition
import PresentationHelper

@Reducer
public struct RegisterTrainingFeature: Sendable {
    public init() {}
    
    @ObservableState
    public struct State {
        private init(session: Session, trainingRecord: TrainingRecord) {
            self.session = session
            self.trainingRecord = trainingRecord
        }
        let session: Session
        var trainingRecord: TrainingRecord
        var menu: LoadStatus<Menu> = .idle
        var menuValue: Menu {
            guard let menu = menu.value else {
                preconditionFailure("値がセットされてから読み込んでください")
            }
            return menu
        }
        var weights: LoadStatus<[Weight]> = .idle
        var weightsValue: [Weight] {
            guard let weights = weights.value else {
                preconditionFailure("値がセットされてから読み込んでください")
            }
            return weights
        }
        var isLoading: Bool {
            menu.isLoading || weights.isLoading
        }
        var error: DomainError? {
            menu.error ?? weights.error ?? nil
        }
        var weightSelection: WeightInputMode = .select
        var timeSelection: TimeInputMode = .timeSelect
    }
    
    enum WeightInputMode: String, Equatable, CaseIterable {
        case select = "プレート選択"
        case manual = "手動入力"
    }
    
    enum TimeInputMode: String, Equatable, CaseIterable {
        case timeSelect = "時間選択"
        case setAndReps = "回数入力"
    }
    
    enum TimeMode: String, CaseIterable {
        case tenSeconds = "10秒"
        case oneMinute = "1分"
        
        var value: Int {
            switch self {
            case .tenSeconds:
                return 10
                
            case .oneMinute:
                return 60
            }
        }
    }
    
    @CasePathable
    public enum Action: BindableAction {
        case binding(BindingAction<State>)
        case onAppear
        case onTapClose
        case onTapRegister
        case fetchMenuDetailSuccess(Menu)
        case fetchMenuDetailFailed(DomainError)
        case fetchAllWeightSuccess([Weight])
        case fetchAllWeightFailed(DomainError)
        case onTapTimeIncrement(Int)
        case onTapTimeDecrement(Int)
        case incrementSets
        case decrementSets
        case incrementReps
        case decrementReps
        case retry
    }
    
    @Dependency(\.dismiss) var dismiss
    @Dependency(\.menuUseCases) var menu
    @Dependency(\.weightUseCases) var weight
    public var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .onAppear, .retry:
                return .merge(
                    fetchMenuDetail(state: &state),
                    fetchAllWeight(state: &state)
                )
                
            case .fetchMenuDetailSuccess(let menu):
                state.menu = .loaded(menu)
                return .none
                
            case .fetchAllWeightSuccess(let weights):
                state.weights = .loaded(weights)
                return .none
                
            case .fetchMenuDetailFailed(let error):
                state.menu = .error(error)
                return .none
                
            case .fetchAllWeightFailed(let error):
                state.weights = .error(error)
                return .none

            case .onTapClose:
                return .run { _ in
                    await dismiss()
                }
                
            case .onTapTimeIncrement(let time):
                state.trainingRecord.incrementTimeDuration(time: time)
                return .none
                
            case .onTapTimeDecrement(let time):
                state.trainingRecord.decrementTimeDuration(time: time)
                return .none
                
            case .incrementSets:
                state.trainingRecord.incrementSets()
                return .none
                
            case .decrementSets:
                state.trainingRecord.decrementSets()
                return .none
                
            case .incrementReps:
                state.trainingRecord.incrementReps()
                return .none
                
            case .decrementReps:
                state.trainingRecord.decrementReps()
                return .none
                
            default:
                return .none
            }
        }
    }
    
    private func fetchMenuDetail(state: inout State) -> Effect<Action> {
        state.menu = .loading
        return .runDomainError { [menuName = state.session.name] send in
            let menu = try await menu.fetchDetail(by: menuName)
            await send(.fetchMenuDetailSuccess(menu))
        } catch: { error, send in
            await send(.fetchMenuDetailFailed(error))
        }
    }
    
    private func fetchAllWeight(state: inout State) -> Effect<Action> {
        state.weights = .loading
        return .runDomainError { send in
            let weights = try await weight.fetchAll()
            await send(.fetchAllWeightSuccess(weights))
        } catch: { error, send in
            await send(.fetchAllWeightFailed(error))
        }

    }
}

public extension RegisterTrainingFeature.State {
    static func initial(session: Session) -> Self {
        @Dependency(\.uuid) var uuid
        @Dependency(\.date) var date
        return .init(
            session: session,
            trainingRecord: .newRecord(
                id: uuid(),
                recordAt: date(),
                menuName: session.name
            )
        )
    }
}
