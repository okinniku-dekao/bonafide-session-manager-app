//
//  GIFImage.swift
//  BonafideSharedFramework
//
//  Created by 東　秀斗 on 2025/04/20.
//

import SwiftUI
import Resources
import Kingfisher

public struct GIFImage: View {
    private let name: String

    init(name: String) {
        self.name = name
    }
    
    public var body: some View {
        KFAnimatedImage(AnimationAsset.url(name))
            .aspectRatio(contentMode: .fit)
    }
}

#if DEBUG
#Preview {
    VStack {
        GIFImage(name: "101_Butt_Stretch")
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
