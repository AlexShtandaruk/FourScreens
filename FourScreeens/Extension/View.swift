import SwiftUI

extension View {
    
    // for gesture webView
    func swipe(
        up: @escaping (() -> Void) = {},
        down: @escaping (() -> Void) = {},
        left: @escaping (() -> Void) = {},
        right: @escaping (() -> Void) = {}
    ) -> some View {
        return self.gesture(DragGesture(minimumDistance: 3, coordinateSpace: .local)
            .onEnded({ value in
                switch(value.translation.width, value.translation.height) {
                case (...0, -30...30):
                    left()
                case (0..., -30...30):
                    right()
                case (-100...100, ...0):
                    up()
                case (-100...100, 0...):
                    down()
                default:
                    print("no clue")
                }
            }))
    }
}
