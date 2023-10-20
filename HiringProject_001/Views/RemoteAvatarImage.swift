import NukeUI
import SwiftUI

struct RemoteAvatarImage: View {
    let imageUrl: URL?
    let width: CGFloat
    let withStroke: Bool
    private let rect: CGRect

    init(imageUrl: URL?, width: CGFloat = 44, withStroke: Bool = false) {
        self.imageUrl = imageUrl
        self.width = width
        self.withStroke = withStroke
        rect = CGRect(origin: .zero, size: CGSize(width: width, height: width))
    }

    var body: some View {
        ZStack {

            LazyImage(url: imageUrl) { state in
                if let image = state.image {
                    image
                        .profileImageStyling(rect: rect, withStroke: withStroke)
                } else {
                    placeHolder
                }

                if state.isLoading {
                    LoadingView(isLoading: true)
                        .frame(width: 40, height: 40)
                }
            }
        }
    }

    var placeHolder: some View {
        Circle()
            .fill(Color.secondary)
            .frame(width: rect.width, height: rect.height)
    }
}

#Preview {
    RemoteAvatarImage(imageUrl: User.mock.imageURL)
}

struct RemoteImage: View {
    let imageUrl: URL?
    var body: some View {
        LazyImage(url: imageUrl) { state in
            if let image = state.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .transition(.opacity)
            }

            if state.isLoading {
                LoadingView(isLoading: true)
                    .frame(width: 20, height: 20)
            }
        }
    }
}
