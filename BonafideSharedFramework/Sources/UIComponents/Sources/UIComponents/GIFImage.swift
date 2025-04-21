//
//  GIFImage.swift
//  BonafideSharedFramework
//
//  Created by 東　秀斗 on 2025/04/20.
//

import SwiftUI
import Resources
import SDWebImageSwiftUI

public struct GIFImage: View {
    private let name: String

    public init(name: String) {
        self.name = name
    }
    
    public var body: some View {
        AnimatedImage(url: AnimationAsset.url(name))
            .resizable()
            .scaledToFit()
    }
}

#if DEBUG
#Preview {
    // 初期化はアプリのエントリポイントでやるのでPreview時はここで設定
    SDImageCodersManager.shared.addCoder(SDImageAWebPCoder())
    return VStack {
        GIFImage(name: "103_Dynamic_Stretch")
        GIFImage(name: "101_Butt_Stretch")
            .frame(height: 100)
        HStack {
            GIFImage(name: "101_Butt_Stretch")
            Text("ストレッチ")
        }
        .frame(height: 45)
    }
}
#endif
