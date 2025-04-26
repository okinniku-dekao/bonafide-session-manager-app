//
//  ValidationError.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/13.
//


public enum ValidationError: Equatable, Error {
    case invalidUserName
    case invalidDeviceName
    case invalidMenuName
    case invalidMenuNumber
    case invalidSatisfaction
    case invalidWeightValue
    case invalidDurationValue
    case invalidSetsAndReps
}
