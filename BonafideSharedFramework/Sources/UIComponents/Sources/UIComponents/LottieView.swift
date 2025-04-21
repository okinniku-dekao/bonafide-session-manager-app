// UIComponents モジュールに LottieView.swift ファイルを作成
import SwiftUI
import Lottie
import Resources

public struct LottieView: UIViewRepresentable {
    private let animationName: String
    private let loopMode: LottieLoopMode
    private let contentMode: UIView.ContentMode
    
    public init(
        animationName: String,
        loopMode: LottieLoopMode = .loop,
        contentMode: UIView.ContentMode = .scaleAspectFit
    ) {
        self.animationName = animationName
        self.loopMode = loopMode
        self.contentMode = contentMode
    }
    
    public func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        let animationView = LottieAnimationView()
        
        // Resources モジュールから JSON ファイルを取得
        if let bundle = Bundle.module {
            if let animation = LottieAnimation.named(animationName, bundle: bundle) {
                animationView.animation = animation
                animationView.contentMode = contentMode
                animationView.loopMode = loopMode
                animationView.play()
                
                // 親ビューに追加
                animationView.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview(animationView)
                
                NSLayoutConstraint.activate([
                    animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
                    animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
                ])
            }
        }
        
        return view
    }
    
    public func updateUIView(_ uiView: UIView, context: Context) {
        // アップデートが必要な場合はここに実装
    }
}

// LottieAnimation を手動で指定するオプショナルバージョンも追加
public struct LottieAnimationView: UIViewRepresentable {
    private let animation: LottieAnimation
    private let loopMode: LottieLoopMode
    private let contentMode: UIView.ContentMode
    
    public init(
        animation: LottieAnimation,
        loopMode: LottieLoopMode = .loop,
        contentMode: UIView.ContentMode = .scaleAspectFit
    ) {
        self.animation = animation
        self.loopMode = loopMode
        self.contentMode = contentMode
    }
    
    public func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        let animationView = LottieAnimationView(animation: animation)
        
        animationView.contentMode = contentMode
        animationView.loopMode = loopMode
        animationView.play()
                
        // 親ビューに追加
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
                
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        return view
    }
    
    public func updateUIView(_ uiView: UIView, context: Context) {
        // アップデートが必要な場合はここに実装
    }
}