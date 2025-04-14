//
//  FirebaseDataStore.swift
//  Data
//
//  Created by 東　秀斗 on 2025/04/13.
//

public protocol FirebaseDataStore {
    // MARK: - Deivce
    func registerDevice(_ device: DeviceDTO) async throws(DataStoreError)
    func deleteDevice(_ deviceId: String) async throws(DataStoreError)
    func updateDevice(_ device: DeviceDTO) async throws(DataStoreError)
    func fetchAllDevice() async throws(DataStoreError) -> [DeviceDTO]
    
    // MARK: - MenuNote
    func registerMenuNote(userId: String, menuNoteDTO: MenuNoteDTO) async throws(DataStoreError)
    func deleteMenuNote(userId: String, menuNoteId: String) async throws(DataStoreError)
    func updateMenuNote(userId: String, menuNoteDTO: MenuNoteDTO) async throws(DataStoreError)
    func fetchAllMenuNote(userId: String) async throws(DataStoreError) -> [MenuNoteDTO]
    
    // MARK: - Menu
    func registerMenu(_ menuDTO: MenuDTO) async throws(DataStoreError)
    func deleteMenu(menuId: String) async throws(DataStoreError)
    func updateMenu(_ menuDTO: MenuDTO) async throws(DataStoreError)
    func fetchAllMenu() async throws(DataStoreError) -> [MenuDTO]
    
    // MARK: - Session
    func registerSession(userId: String, sessionDTO: [SessionDTO]) async throws(DataStoreError)
    func deleteSession(userId: String, sessionIds: [String]) async throws(DataStoreError)
    func fetchAllSession(userId: String) async throws(DataStoreError) -> [SessionDTO]
    
    // MARK: - TrainingRecord
    func registerTrainingRecord(userId: String, trainingRecordDTO: TrainingRecordDTO) async throws(DataStoreError)
    func deleteTrainingRecord(userId: String, trainingRecordId: String) async throws(DataStoreError)
    func fetchAllTrainingRecord(userId: String) async throws(DataStoreError) -> [TrainingRecordDTO]
    
    // MARK: - User
    func registerUser(userDTO: UserDTO) async throws(DataStoreError)
    func updateUser(userDTO: UserDTO) async throws(DataStoreError)
    func deleteUser(userId: String) async throws(DataStoreError)
    func fetchAllUser() async throws(DataStoreError) -> [UserDTO]
    
    // MARK: - Weight
    func registerWeight(weightDTO: WeightDTO) async throws(DataStoreError)
    func deleteWeight(weightId: String) async throws(DataStoreError)
    func updateWeight(weightDTO: WeightDTO) async throws(DataStoreError)
    func fetchAllWeight() async throws(DataStoreError) -> [WeightDTO]
}
