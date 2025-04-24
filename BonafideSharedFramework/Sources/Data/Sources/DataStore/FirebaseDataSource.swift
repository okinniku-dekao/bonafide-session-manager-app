//
//  FirebaseDataSource.swift
//  Data
//
//  Created by 東　秀斗 on 2025/04/13.
//

public protocol FirebaseDataSource: Sendable {
    // MARK: - Deivce
    func registerDevice(_ device: DeviceDTO) async throws(DataSourceError)
    func deleteDevice(_ deviceId: String) async throws(DataSourceError)
    func updateDevice(_ device: DeviceDTO) async throws(DataSourceError)
    func fetchAllDevice() async throws(DataSourceError) -> [DeviceDTO]
    func fetchDeviceDetail(_ deviceId: String) async throws(DataSourceError) -> DeviceDTO
    func streamConnectedUserId(deviceId : String) async -> AsyncThrowingStream<String, any Error>
    
    // MARK: - MenuNote
    func registerMenuNote(userId: String, menuNoteDTO: MenuNoteDTO) async throws(DataSourceError)
    func deleteMenuNote(userId: String, menuNoteId: String) async throws(DataSourceError)
    func updateMenuNote(userId: String, menuNoteDTO: MenuNoteDTO) async throws(DataSourceError)
    func fetchAllMenuNote(userId: String) async throws(DataSourceError) -> [MenuNoteDTO]
    
    // MARK: - Menu
    func registerMenu(_ menuDTO: MenuDTO) async throws(DataSourceError)
    func deleteMenu(menuId: String) async throws(DataSourceError)
    func updateMenu(_ menuDTO: MenuDTO) async throws(DataSourceError)
    func fetchAllMenu() async throws(DataSourceError) -> [MenuDTO]
    
    // MARK: - Session
    func registerSession(userId: String, sessionDTO: [SessionDTO]) async throws(DataSourceError)
    func deleteSession(userId: String, sessionIds: [String]) async throws(DataSourceError)
    func fetchAllSession(userId: String) async throws(DataSourceError) -> [SessionDTO]
    func streamAllSession(userId: String) async -> AsyncThrowingStream<[SessionDTO], any Error>
    
    // MARK: - TrainingRecord
    func registerTrainingRecord(userId: String, trainingRecordDTO: TrainingRecordDTO) async throws(DataSourceError)
    func deleteTrainingRecord(userId: String, trainingRecordId: String) async throws(DataSourceError)
    func fetchAllTrainingRecord(userId: String) async throws(DataSourceError) -> [TrainingRecordDTO]
    
    // MARK: - User
    func registerUser(userDTO: UserDTO) async throws(DataSourceError)
    func updateUser(userDTO: UserDTO) async throws(DataSourceError)
    func deleteUser(userId: String) async throws(DataSourceError)
    func fetchAllUser() async throws(DataSourceError) -> [UserDTO]
    
    // MARK: - Weight
    func registerWeight(weightDTO: WeightDTO) async throws(DataSourceError)
    func deleteWeight(weightId: String) async throws(DataSourceError)
    func updateWeight(weightDTO: WeightDTO) async throws(DataSourceError)
    func fetchAllWeight() async throws(DataSourceError) -> [WeightDTO]
}
