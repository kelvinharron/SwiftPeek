import SwiftUI
import UIKit

public final class SwiftPeekManager {
    public static let shared = SwiftPeekManager()
    private var peekWindow: UIWindow?

    private init() {}

    public func show() {
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            let window = UIWindow(windowScene: scene)
            let hostingController = UIHostingController(rootView: SwiftPeekView())
            window.rootViewController = hostingController
            window.windowLevel = .alert + 1
            window.alpha = 0
            window.makeKeyAndVisible()
            UIView.animate(withDuration: 0.3) {
                window.alpha = 1
            }

            peekWindow = window
        }
    }

    public func dismiss() {
        if let window = peekWindow {
            UIView.animate(withDuration: 0.3, animations: {
                window.alpha = 0
            }, completion: { _ in
                window.isHidden = true
                self.peekWindow = nil
            })
        }
    }
}
