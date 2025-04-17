//
//  FirebaseDataStoreImp.swift
//  Infrastructure
//
//  Created by 東　秀斗 on 2025/04/14.
//

import Data
@preconcurrency import FirebaseFirestore

public actor FirebaseDataStoreImpl: FirebaseDataStore {
    typealias Key = FirebaseCollectionKey
    private let db = Firestore.firestore()
    
    public init() {}

    // MARK: - Device
    public func registerDevice(_ device: DeviceDTO) async throws(DataStoreError) {
        try await handle {
            try db.collection(Key.devices).document(device.id).setData(from: device)
        }
    }
    
    public func deleteDevice(_ deviceId: String) async throws(DataStoreError) {
        try await handle {
            try await db.collection(Key.devices).document(deviceId).delete()
        }
    }
    
    public func updateDevice(_ device: DeviceDTO) async throws(DataStoreError) {
        try await handle {
            try db.collection(Key.devices).document(device.id).setData(from: device, merge: true)
        }
    }
    
    public func fetchAllDevice() async throws(DataStoreError) -> [DeviceDTO] {
        try await handle {
            try await db.collection(Key.devices).getDocuments().documents.map {
                try $0.data(as: DeviceDTO.self)
            }
        }
    }
    
    public func fetchDeviceDetail(_ deviceId: String) async throws(DataStoreError) -> DeviceDTO {
        try await handle {
            try await db.collection(Key.devices).document(deviceId).getDocument().data(as: DeviceDTO.self)
        }
    }
    
    public func streamConnectedUserId(deviceId: String) async -> AsyncThrowingStream<String, any Error> {
        stream(reference: db.collection(Key.devices).document(deviceId)) { snapshot in
            (try? snapshot?.data(as: DeviceDTO.self).connectedUserId) ?? ""
        }
    }
    
    // MARK: - MenuNote
    public func registerMenuNote(userId: String, menuNoteDTO: MenuNoteDTO) async throws(DataStoreError) {
        try await handle {
            try await db.collection(Key.users).document(userId).setData(["menus": FieldValue.arrayUnion([menuNoteDTO])], merge: true)
        }
    }
    
    public func deleteMenuNote(userId: String, menuNoteId: String) async throws(DataStoreError) {
        try await handle {
            guard let menuNote = try await fetchAllMenuNote(userId: userId).first(where: { $0.id == menuNoteId }) else {
                 return
            }
            try await db.collection(Key.users).document(userId).setData(["menus": FieldValue.arrayRemove([menuNote])], merge: true)
        }
    }
    
    public func updateMenuNote(userId: String, menuNoteDTO: MenuNoteDTO) async throws(DataStoreError) {
        try await handle {
            try await deleteMenuNote(userId: userId, menuNoteId: menuNoteDTO.id)
            try await db.collection(Key.users).document(userId).setData(["menus": FieldValue.arrayUnion([menuNoteDTO])], merge: true)
        }
    }
    
    public func fetchAllMenuNote(userId: String) async throws(DataStoreError) -> [MenuNoteDTO] {
        try await handle {
            try await db.collection(Key.users).document(userId).getDocument().data(as: UserDTO.self).menus
        }
    }
    
    // MARK: - Menu
    public func registerMenu(_ menuDTO: MenuDTO) async throws(DataStoreError) {
        try await handle {
            try db.collection(Key.menus).document(menuDTO.id).setData(from: menuDTO)
        }
    }
    
    public func deleteMenu(menuId: String) async throws(DataStoreError) {
        try await handle {
            try await db.collection(Key.menus).document(menuId).delete()
        }
    }
    
    public func updateMenu(_ menuDTO: MenuDTO) async throws(DataStoreError) {
        try await handle {
            try db.collection(Key.menus).document(menuDTO.id).setData(from: menuDTO, merge: true)
        }
    }
    
    public func fetchAllMenu() async throws(DataStoreError) -> [MenuDTO] {
        try await handle {
            try await db.collection(Key.menus).getDocuments().documents.map { try $0.data(as: MenuDTO.self) }
        }
    }
    
    // MARK: - Session
    public func registerSession(userId: String, sessionDTO: [SessionDTO]) async throws(DataStoreError) {
        try await handle {
            try await db.collection(Key.users).document(userId).setData(["sessions": FieldValue.arrayUnion(sessionDTO)], merge: true)
        }
    }
    
    public func deleteSession(userId: String, sessionIds: [String]) async throws(DataStoreError) {
        try await handle {
            let sessions = try await fetchAllSession(userId: userId).filter { sessionIds.contains($0.id) }
            try await db.collection(Key.users).document(userId).setData(["sessions": FieldValue.arrayRemove(sessions)], merge: true)
        }
    }
    
    public func fetchAllSession(userId: String) async throws(DataStoreError) -> [SessionDTO] {
        try await handle {
            try await db.collection(Key.users).document(userId).getDocument().data(as: UserDTO.self).sessions
        }
    }
    
    public func streamAllSession(userId: String) async -> AsyncThrowingStream<[SessionDTO], any Error> {
        stream(reference: db.collection(Key.users).document(userId)) { snapshot in
            (try? snapshot?.data(as: UserDTO.self).sessions) ?? []
        }
    }
    
    // MARK: - TrainingRecord
    public func registerTrainingRecord(userId: String, trainingRecordDTO: TrainingRecordDTO) async throws(DataStoreError) {
        try await handle {
            try await db.collection(Key.users).document(userId).setData(["trainingRecords": FieldValue.arrayUnion([trainingRecordDTO])], merge: true)
        }
    }
    
    public func deleteTrainingRecord(userId: String, trainingRecordId: String) async throws(DataStoreError) {
        try await handle {
            guard let trainingRecord = try await fetchAllTrainingRecord(userId: userId).first(where: { $0.id == trainingRecordId }) else {
                return
            }
            try await db.collection(Key.users).document(userId).setData(["trainingRecords": FieldValue.arrayRemove([trainingRecord])], merge: true)
        }
    }
    
    public func fetchAllTrainingRecord(userId: String) async throws(DataStoreError) -> [TrainingRecordDTO] {
        try await handle {
            try await db.collection(Key.users).document(userId).getDocument().data(as: UserDTO.self).trainingRecords
        }
    }
    
    // MARK: - User
    public func registerUser(userDTO: UserDTO) async throws(DataStoreError) {
        try await handle {
            try db.collection(Key.users).document(userDTO.id).setData(from: userDTO)
        }
    }
    
    public func updateUser(userDTO: UserDTO) async throws(DataStoreError) {
        try await handle {
            try db.collection(Key.users).document(userDTO.id).setData(from: userDTO, merge: true)
        }
    }
    
    public func deleteUser(userId: String) async throws(DataStoreError) {
        try await handle {
            try await db.collection(Key.users).document(userId).delete()
        }
    }
    
    public func fetchAllUser() async throws(DataStoreError) -> [UserDTO] {
        try await handle {
            try await db.collection(Key.users).getDocuments().documents.map { try $0.data(as: UserDTO.self) }
        }
    }
    
    // MARK: - Weight
    public func registerWeight(weightDTO: WeightDTO) async throws(DataStoreError) {
        try await handle {
            try db.collection(Key.weights).document(weightDTO.id).setData(from: weightDTO)
        }
    }
    
    public func deleteWeight(weightId: String) async throws(DataStoreError) {
        try await handle {
            try await db.collection(Key.weights).document(weightId).delete()
        }
    }
    
    public func updateWeight(weightDTO: WeightDTO) async throws(DataStoreError) {
        try await handle {
            try db.collection(Key.weights).document(weightDTO.id).setData(from: weightDTO, merge: true)
        }
    }
    
    public func fetchAllWeight() async throws(DataStoreError) -> [WeightDTO] {
        try await handle {
            try await db.collection(Key.weights).getDocuments().documents.map { try $0.data(as: WeightDTO.self) }
        }
    }
}

extension FirebaseDataStoreImpl {
    private func handle<T: Sendable>(
        _ operation: () async throws -> T
    ) async throws(DataStoreError) -> T {
        do {
            return try await operation()
        } catch {
            throw DataStoreError(from: error)
        }
    }
    
    private func stream<T>(
        reference: DocumentReference,
        transform: @escaping (DocumentSnapshot?) throws -> T
    ) -> AsyncThrowingStream<T, any Error> {
        AsyncThrowingStream { continuation in
            let listener = reference.addSnapshotListener { snapshot, error in
                if let error {
                    continuation.finish(throwing: DataStoreError(from: error))
                    return
                } else {
                    do {
                        let result = try transform(snapshot)
                        continuation.yield(result)
                    } catch {
                        continuation.finish(throwing: DataStoreError(from: error))
                    }
                }
            }
            
            continuation.onTermination = { _ in
                listener.remove()
            }
        }
    }
}
