import SwiftUI

struct FeedView: View {
    let user: User
    let newsFeeds: [NewsFeed]

    var body: some View {
        LazyVStack {
            ForEach(newsFeeds) { newsFeed in
                FeedCell(user: user, newsFeed: newsFeed)
            }
        }
    }
}

#Preview {
    FeedView(user: .mock, newsFeeds: [.mock])
}
