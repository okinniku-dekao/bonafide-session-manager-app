// ErrorView.swift
// BonafideSharedFramework/Sources/PresentationHelper/Sources/Views/ErrorView.swift

import SwiftUI
import Domain
import Resources

public struct ErrorView: View {
    private let error: DomainError
    private let retryAction: (() -> Void)?
    private let closeAction: (() -> Void)?
    
    public init(
        error: DomainError,
        retryAction: (() -> Void)? = nil,
        closeAction: (() -> Void)? = nil
    ) {
        self.error = error
        self.retryAction = retryAction
        self.closeAction = closeAction
    }
    
    public var body: some View {
        VStack(spacing: 24) {
            Image(systemName: getErrorIconName())
                .font(.system(size: 60))
                .foregroundColor(.red)
                .padding(.top, 32)
            
            Text(getErrorTitle())
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
            Text(getErrorMessage())
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)
            
            Spacer()
            
            HStack(spacing: 16) {
                if let retryAction = retryAction {
                    Button(action: retryAction) {
                        Text("再試行")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(uiColor: sharedColors.primary()!))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                
                if let closeAction = closeAction {
                    Button(action: closeAction) {
                        Text("閉じる")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .foregroundColor(.primary)
                            .cornerRadius(10)
                    }
                }
            }
            .padding(.horizontal, 32)
            .padding(.bottom, 32)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(uiColor: sharedColors.commonBackground()!).ignoresSafeArea())
    }
    
    private func getErrorIconName() -> String {
        switch error {
        case .networkError:
            return "wifi.slash"
        case .notFound:
            return "magnifyingglass"
        case .permissionDenied, .unauthorized:
            return "lock.shield"
        case .conflict:
            return "exclamationmark.triangle"
        case .faildSave:
            return "xmark.circle"
        case .validation:
            return "exclamationmark.circle"
        case .unknown:
            return "questionmark.circle"
        }
    }
    
    private func getErrorTitle() -> String {
        switch error {
        case .networkError:
            return "ネットワークエラー"
        case .notFound:
            return "データが見つかりません"
        case .permissionDenied:
            return "アクセス権限がありません"
        case .conflict:
            return "データの競合が発生しました"
        case .unauthorized:
            return "認証エラー"
        case .faildSave:
            return "保存に失敗しました"
        case .validation(let validationError):
            switch validationError {
            case .invalidUserName:
                return "ユーザー名が無効です"
            case .invalidDeviceName:
                return "デバイス名が無効です"
            case .invalidMenuName:
                return "メニュー名が無効です"
            case .invalidMenuNumber:
                return "メニュー番号が無効です"
            case .invalidSatisfaction:
                return "満足度が無効です"
            case .invalidWeightValue:
                return "重量値が無効です"
            case .invalidDurationValue:
                return "時間値が無効です"
            }
        case .unknown:
            return "予期せぬエラーが発生しました"
        }
    }
    
    private func getErrorMessage() -> String {
        switch error {
        case .networkError:
            return "インターネット接続を確認して、再度お試しください。"
        case .notFound:
            return "お探しのデータが見つかりませんでした。削除されたか、移動された可能性があります。"
        case .permissionDenied:
            return "このデータにアクセスする権限がありません。管理者に連絡してください。"
        case .conflict:
            return "他のユーザーが同時に同じデータを編集した可能性があります。最新の状態に更新してから再度お試しください。"
        case .unauthorized:
            return "セッションが期限切れになったか、ログインが必要です。"
        case .faildSave:
            return "データの保存中にエラーが発生しました。再度お試しください。"
        case .validation(let validationError):
            switch validationError {
            case .invalidUserName:
                return "有効なユーザー名を入力してください。"
            case .invalidDeviceName:
                return "有効なデバイス名を入力してください。"
            case .invalidMenuName:
                return "有効なメニュー名を入力してください。"
            case .invalidMenuNumber:
                return "有効なメニュー番号を入力してください。"
            case .invalidSatisfaction:
                return "満足度を選択してください。"
            case .invalidWeightValue:
                return "有効な重量値を入力してください。"
            case .invalidDurationValue:
                return "有効な時間を入力してください。"
            }
        case .unknown(let message):
            return "エラーが発生しました：\(message)"
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        ErrorView(
            error: .networkError,
            retryAction: {},
            closeAction: {}
        )
        
        ErrorView(
            error: .notFound,
            retryAction: {}
        )
        
        ErrorView(
            error: .validation(.invalidUserName),
            closeAction: {}
        )
        
        ErrorView(
            error: .unknown("サーバーエラー")
        )
    }
}