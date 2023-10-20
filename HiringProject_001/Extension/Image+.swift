import SwiftUI

extension Image {
    func profileImageStyling(rect: CGRect, withStroke: Bool = false) -> some View {
        let circleWidth = withStroke ? rect.width + 10 : rect.width
        return resizable()
            .aspectRatio(contentMode: .fill)
            .clipShape(Circle())
            .frame(width: rect.width, height: rect.height)
            .transition(.opacity)
            .overlay(
                Circle()
                    .stroke(Color.background, lineWidth: withStroke ? 10 : 0)
                    .frame(width: circleWidth, height: circleWidth)
            )
    }
}
