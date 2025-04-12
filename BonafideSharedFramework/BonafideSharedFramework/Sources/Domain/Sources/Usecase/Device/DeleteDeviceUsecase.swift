public protocol DeleteDeviceUsecase {
    func callAsFunction(deviceId: String) async throws
}