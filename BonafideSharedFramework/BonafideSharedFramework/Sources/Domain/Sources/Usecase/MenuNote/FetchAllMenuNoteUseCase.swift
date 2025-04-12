//
//  FetchAllMenuNoteUseCase.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/13.
//


public protocol FetchAllMenuNoteUseCase {
    func callAsFunction() async throws -> [MenuNote]
}
