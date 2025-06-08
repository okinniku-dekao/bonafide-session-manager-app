//
//  RegisterTrainingFeature+State.swift
//  RegisterTrainingFeature
//
//  Created by 東　秀斗 on 2025/05/31.
//

import ComposableArchitecture
import Domain
import Composition
import PresentationHelper

extension RegisterTrainingFeature {
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
        var isLoaded: Bool {
            menu.isLoaded && weights.isLoaded
        }
        var error: DomainError? {
            menu.error ?? weights.error ?? nil
        }
        var weightSelection: WeightInputMode = .select
        var timeSelection: TimeInputMode = .timeSelect
        
        var customWeight: String = ""
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
