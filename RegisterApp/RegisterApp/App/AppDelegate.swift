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
import SDWebImageSwiftUI

final class AppDelegate: NSObject, UIApplicationDelegate {
    let store = Store(initialState: AppRootFeature.State()) {
        AppRootFeature()
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        setupNavigationBarAppearance()
        setupTabBarAppearance()
        setupSDWebImageWebPDecoder()
        setupSegmentedControll()
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
    
    private func setupTabBarAppearance() {
        let appearance: UITabBarAppearance = UITabBarAppearance()
        appearance.backgroundColor = .white
        UITabBar.appearance().scrollEdgeAppearance = appearance
        UITabBar.appearance().standardAppearance = appearance
    }
    
    private func setupSegmentedControll() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .white
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
    }
    
    private func setupSDWebImageWebPDecoder() {
        SDImageCodersManager.shared.addCoder(SDImageAWebPCoder())
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
