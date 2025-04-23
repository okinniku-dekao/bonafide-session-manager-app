// The Swift Programming Language
// https://docs.swift.org/swift-book

import ComposableArchitecture
import Domain

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
        
        public static func initial(session: Session) -> Self {
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
    
    @CasePathable
    public enum Action {
        case onTapClose
        case onTapRegister
    }
    
    @Dependency(\.dismiss) var dismiss
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onTapClose:
                return .run { _ in
                    await dismiss()
                }
                
            default:
                return .none
            }
        }
    }
}
