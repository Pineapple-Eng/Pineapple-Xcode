// Created by Dhamova on 2023-04-20.

import SwiftUI

struct SandiaButtonStyle: ButtonStyle {
    var padding: CGFloat? = nil

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .bold()
            .padding(.all, padding)
            .background(.regularMaterial)
            .foregroundColor(.primary)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
            .shadow(radius: 1)
    }
}
