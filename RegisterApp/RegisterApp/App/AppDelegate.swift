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

final class AppDelegate: NSObject, UIApplicationDelegate {
    let store = Store(initialState: AppRootFeature.State()) {
        AppRootFeature()
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
