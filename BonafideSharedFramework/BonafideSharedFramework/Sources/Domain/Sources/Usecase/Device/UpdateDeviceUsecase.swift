public protocol UpdateDeviceUsecase {
    func callAsFunction(_ device: Device) async throws
}