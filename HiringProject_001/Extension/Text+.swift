import SwiftUI

extension Text {
    func regularStyling(size: CGFloat = 14, color: Color = .secondary) -> some View {
        font(.regular(size))
            .foregroundColor(.white)
    }

    func boldStyling(size: CGFloat = 14) -> some View {
        font(.bold(size))
            .foregroundColor(.white)
    }
}
