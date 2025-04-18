//
//  AppDelegate.swift
//  RegisterApp
//
//  Created by hideto.higashi on 2025/03/04.
//

import SwiftUI
import ComposableArchitecture
import AppRootFeature
import FirebaseCore
import FirebaseFirestore
import Composition
import Infrastructure

final class AppDelegate: NSObject, UIApplicationDelegate {
    let store = Store(initialState: AppRootFeature.State()) {
        AppRootFeature()
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        setupNavigationBarAppearance()
        DeviceUseCases.serviceName = Bundle.main.bundleIdentifier ?? "default.bundle.identifier"
        #if DEBUG
        // デバッグ用でKeychainに保存した端末IDを削除する
//        resetKeychain(service: DeviceUseCases.serviceName)
        #endif
        FirebaseApp.configure()
        return true
    }
}

extension AppDelegate {
    private func setupNavigationBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.clear
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
    }
}


#if DEBUG
extension AppDelegate {
    private func resetKeychain(service: String) {
        Task {
            await KeychainManager.shared.deleteDeviceId(service: service)
        }
    }
}
#endif
