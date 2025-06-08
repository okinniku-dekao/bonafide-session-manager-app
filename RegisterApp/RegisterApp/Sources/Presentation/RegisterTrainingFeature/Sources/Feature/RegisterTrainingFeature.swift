// The Swift Programming Language
// https://docs.swift.org/swift-book

import ComposableArchitecture
import Domain
import Composition
import PresentationHelper
import Foundation

@Reducer
public struct RegisterTrainingFeature: Sendable {
    public init() {}
    
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
                
            case .binding(\.customWeight):
                let pattern = "^\\d*\\.?\\d{0,1}$"
                let regex = try! NSRegularExpression(pattern: pattern)
                let range = NSRange(location: 0, length: state.customWeight.utf16.count)
                
                if regex.firstMatch(in: state.customWeight, options: [], range: range) != nil {
                    state.customWeight = state.customWeight
                } else {
                    // マッチしない場合は、前の有効な値を返す
                    state.customWeight = String(state.customWeight.dropLast())
                }
                return .none
                
            default:
                return .none
            }
        }
        ._printChanges()
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
