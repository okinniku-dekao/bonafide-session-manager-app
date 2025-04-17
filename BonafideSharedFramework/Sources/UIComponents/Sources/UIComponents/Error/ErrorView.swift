//
//  ErrorView.swift
//  BonafideSharedFramework
//
//  Created by 東　秀斗 on 2025/04/17.
//

import SwiftUI
import Domain
import Resources
import PresentationHelper

public struct ErrorView: View {
    private let error: DomainError
    private let retryAction: (() -> Void)?
    
    public init(
        _ error: DomainError,
        retryAction: (() -> Void)? = nil
    ) {
        self.error = error
        self.retryAction = retryAction
    }
    
    public var body: some View {
        VStack(spacing: 24) {
            Image(systemName: error.iconName)
                .font(.system(size: 60))
                .foregroundColor(.red)
                .padding(.top, 32)
            
            Text(error.title)
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.black)
            
            Text(error.message)
                .font(.body)
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)
            
            Spacer()
            
            HStack(spacing: 16) {
                if let retryAction = retryAction {
                    Button(action: retryAction) {
                        Text(l10n.errorButtonRetry())
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(uiColor: sharedColors.primary()!))
                            .foregroundColor(.white)
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
}
