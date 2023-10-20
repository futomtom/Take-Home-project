import SwiftUI

struct Profile: View {
    @ObservedObject var viewModel: ProfileViewModel

    var body: some View {
        let user = viewModel.user
        ScrollView {
            VStack {
                RemoteAvatarImage(
                    imageUrl: user.imageURL,
                    width: Constant.screenWidth / 2,
                    withStroke: true
                )
                .offset(CGSize(width: 10.0, height: 80.0))
                .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)

                ProfileHeader(user: user)
                FeedView(
                    user: viewModel.user,
                    newsFeeds: viewModel.newsFeeds
                )
            }
        }
    }
}

#Preview {
    Profile(viewModel: .mock)
}
