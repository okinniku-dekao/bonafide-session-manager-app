//
//  FetchAllMenuUseCase.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/12.
//


public protocol FetchAllMenuUseCase {
    func callAsFunction() async throws -> [Menu]
}