//
//  RegisterTrainingFeature+Action.swift
//  RegisterTrainingFeature
//
//  Created by 東　秀斗 on 2025/05/31.
//

import ComposableArchitecture
import Domain

extension RegisterTrainingFeature {
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
}
