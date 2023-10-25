import SwiftUI

extension Button {
    func capsuleStyling() -> some View {
        padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color.blue)
            .clipShape(.capsule)
    }
}
