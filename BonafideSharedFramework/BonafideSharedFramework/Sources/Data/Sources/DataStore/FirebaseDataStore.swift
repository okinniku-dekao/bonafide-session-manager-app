//
//  FirebaseDataStore.swift
//  Data
//
//  Created by 東　秀斗 on 2025/04/13.
//

public protocol FirebaseDataStore {
    func register(_ device: DeviceDTO) async throws(DataStoreError)
}
