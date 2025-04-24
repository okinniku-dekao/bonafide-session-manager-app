//
//  firebaseDataSourceImp.swift
//  Infrastructure
//
//  Created by 東　秀斗 on 2025/04/14.
//

import Data
@preconcurrency import FirebaseFirestore

public actor FirebaseDataSourceImpl: FirebaseDataSource {
    typealias Key = FirebaseCollectionKey
    private let db = Firestore.firestore()
    
    public init() {
        let settings = FirestoreSettings()
        settings.isPersistenceEnabled = false
        self.db.settings = settings
    }

    // MARK: - Device
    public func registerDevice(_ device: DeviceDTO) async throws(DataSourceError) {
        try await handle {
            try db.collection(Key.devices).document(device.id).setData(from: device)
        }
    }
    
    public func deleteDevice(_ deviceId: String) async throws(DataSourceError) {
        try await handle {
            try await db.collection(Key.devices).document(deviceId).delete()
        }
    }
    
    public func updateDevice(_ device: DeviceDTO) async throws(DataSourceError) {
        try await handle {
            try db.collection(Key.devices).document(device.id).setData(from: device, merge: true)
        }
    }
    
    public func fetchAllDevice() async throws(DataSourceError) -> [DeviceDTO] {
        try await handle {
            try await db.collection(Key.devices).getDocuments(source: .server).documents.map {
                try $0.data(as: DeviceDTO.self)
            }
        }
    }
    
    public func fetchDeviceDetail(_ deviceId: String) async throws(DataSourceError) -> DeviceDTO {
        try await handle {
            try await db.collection(Key.devices).document(deviceId).getDocument(source: .server).data(as: DeviceDTO.self)
        }
    }
    
    public func streamConnectedUserId(deviceId: String) async -> AsyncThrowingStream<String, any Error> {
        stream(reference: db.collection(Key.devices).document(deviceId)) { snapshot in
            (try? snapshot?.data(as: DeviceDTO.self).connectedUserId) ?? ""
        }
    }
    
    // MARK: - MenuNote
    public func registerMenuNote(userId: String, menuNoteDTO: MenuNoteDTO) async throws(DataSourceError) {
        try await handle {
            try await db.collection(Key.users).document(userId).setData(["menus": FieldValue.arrayUnion([menuNoteDTO])], merge: true)
        }
    }
    
    public func deleteMenuNote(userId: String, menuNoteId: String) async throws(DataSourceError) {
        try await handle {
            guard let menuNote = try await fetchAllMenuNote(userId: userId).first(where: { $0.id == menuNoteId }) else {
                 return
            }
            try await db.collection(Key.users).document(userId).setData(["menus": FieldValue.arrayRemove([menuNote])], merge: true)
        }
    }
    
    public func updateMenuNote(userId: String, menuNoteDTO: MenuNoteDTO) async throws(DataSourceError) {
        try await handle {
            try await deleteMenuNote(userId: userId, menuNoteId: menuNoteDTO.id)
            try await db.collection(Key.users).document(userId).setData(["menus": FieldValue.arrayUnion([menuNoteDTO])], merge: true)
        }
    }
    
    public func fetchAllMenuNote(userId: String) async throws(DataSourceError) -> [MenuNoteDTO] {
        try await handle {
            try await db.collection(Key.users).document(userId).getDocument(source: .server).data(as: UserDTO.self).menus
        }
    }
    
    // MARK: - Menu
    public func registerMenu(_ menuDTO: MenuDTO) async throws(DataSourceError) {
        try await handle {
            try db.collection(Key.menus).document(menuDTO.id).setData(from: menuDTO)
        }
    }
    
    public func deleteMenu(menuId: String) async throws(DataSourceError) {
        try await handle {
            try await db.collection(Key.menus).document(menuId).delete()
        }
    }
    
    public func updateMenu(_ menuDTO: MenuDTO) async throws(DataSourceError) {
        try await handle {
            try db.collection(Key.menus).document(menuDTO.id).setData(from: menuDTO, merge: true)
        }
    }
    
    public func fetchAllMenu() async throws(DataSourceError) -> [MenuDTO] {
        try await handle {
            try await db.collection(Key.menus).getDocuments(source: .server).documents.map { try $0.data(as: MenuDTO.self) }
        }
    }
    
    // MARK: - Session
    public func registerSession(userId: String, sessionDTO: [SessionDTO]) async throws(DataSourceError) {
        try await handle {
            let sessions = try sessionDTO.map { try $0.toDictionary() }
            try await db.collection(Key.users).document(userId).setData(["sessions": FieldValue.arrayUnion(sessions)], merge: true)
        }
    }
    
    public func deleteSession(userId: String, sessionIds: [String]) async throws(DataSourceError) {
        try await handle {
            let sessions = try await fetchAllSession(userId: userId).filter { sessionIds.contains($0.id) }
            try await db.collection(Key.users).document(userId).setData(["sessions": FieldValue.arrayRemove(sessions)], merge: true)
        }
    }
    
    public func fetchAllSession(userId: String) async throws(DataSourceError) -> [SessionDTO] {
        try await handle {
            try await db.collection(Key.users).document(userId).getDocument(source: .server).data(as: UserDTO.self).sessions
        }
    }
    
    public func streamAllSession(userId: String) async -> AsyncThrowingStream<[SessionDTO], any Error> {
        stream(reference: db.collection(Key.users).document(userId)) { snapshot in
            (try? snapshot?.data(as: UserDTO.self).sessions) ?? []
        }
    }
    
    // MARK: - TrainingRecord
    public func registerTrainingRecord(userId: String, trainingRecordDTO: TrainingRecordDTO) async throws(DataSourceError) {
        try await handle {
            try await db.collection(Key.users).document(userId).setData(["trainingRecords": FieldValue.arrayUnion([trainingRecordDTO])], merge: true)
        }
    }
    
    public func deleteTrainingRecord(userId: String, trainingRecordId: String) async throws(DataSourceError) {
        try await handle {
            guard let trainingRecord = try await fetchAllTrainingRecord(userId: userId).first(where: { $0.id == trainingRecordId }) else {
                return
            }
            try await db.collection(Key.users).document(userId).setData(["trainingRecords": FieldValue.arrayRemove([trainingRecord])], merge: true)
        }
    }
    
    public func fetchAllTrainingRecord(userId: String) async throws(DataSourceError) -> [TrainingRecordDTO] {
        try await handle {
            try await db.collection(Key.users).document(userId).getDocument(source: .server).data(as: UserDTO.self).trainingRecords
        }
    }
    
    // MARK: - User
    public func registerUser(userDTO: UserDTO) async throws(DataSourceError) {
        try await handle {
            try db.collection(Key.users).document(userDTO.id).setData(from: userDTO)
        }
    }
    
    public func updateUser(userDTO: UserDTO) async throws(DataSourceError) {
        try await handle {
            try db.collection(Key.users).document(userDTO.id).setData(from: userDTO, merge: true)
        }
    }
    
    public func deleteUser(userId: String) async throws(DataSourceError) {
        try await handle {
            try await db.collection(Key.users).document(userId).delete()
        }
    }
    
    public func fetchAllUser() async throws(DataSourceError) -> [UserDTO] {
        try await handle {
            try await db.collection(Key.users).getDocuments(source: .server).documents.map { try $0.data(as: UserDTO.self) }
        }
    }
    
    // MARK: - Weight
    public func registerWeight(weightDTO: WeightDTO) async throws(DataSourceError) {
        try await handle {
            try db.collection(Key.weights).document(weightDTO.id).setData(from: weightDTO)
        }
    }
    
    public func deleteWeight(weightId: String) async throws(DataSourceError) {
        try await handle {
            try await db.collection(Key.weights).document(weightId).delete()
        }
    }
    
    public func updateWeight(weightDTO: WeightDTO) async throws(DataSourceError) {
        try await handle {
            try db.collection(Key.weights).document(weightDTO.id).setData(from: weightDTO, merge: true)
        }
    }
    
    public func fetchAllWeight() async throws(DataSourceError) -> [WeightDTO] {
        try await handle {
            try await db.collection(Key.weights).getDocuments(source: .server).documents.map { try $0.data(as: WeightDTO.self) }
        }
    }
}

extension FirebaseDataSourceImpl {
    private func handle<T: Sendable>(
        _ operation: () async throws -> T
    ) async throws(DataSourceError) -> T {
        do {
            return try await operation()
        } catch {
            throw DataSourceError(from: error)
        }
    }
    
    private func stream<T>(
        reference: DocumentReference,
        transform: @escaping @Sendable (DocumentSnapshot?) throws -> T
    ) -> AsyncThrowingStream<T, any Error> {
        return AsyncThrowingStream { continuation in
            let listener = reference.addSnapshotListener { snapshot, error in
                Task {
                    guard await isConnected() else {
                        continuation.finish(throwing: DataSourceError.networkError)
                        return
                    }
                    if let error {
                        continuation.finish(throwing: DataSourceError(from: error))
                        return
                    } else {
                        do {
                            let result = try transform(snapshot)
                            continuation.yield(result)
                        } catch {
                            continuation.finish(throwing: DataSourceError(from: error))
                        }
                    }
                }
            }
            
            continuation.onTermination = { _ in
                listener.remove()
            }
        }
        
        // addSnapshotListenerではオフライン状態が取れないのでgetDocumentを使ってネットワーク状態を検知する
        func isConnected() async -> Bool {
            do {
                try await handle { try await reference.getDocument(source: .server) }
                return true
            } catch {
                return error != .networkError
            }
        }
    }
}

extension SessionDTO {
    func toDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        let jsonObject = try JSONSerialization.jsonObject(with: data)
        guard let dictionary = jsonObject as? [String: Any] else {
            throw DataSourceError.faildConvertToData
        }
        return dictionary
    }
}
