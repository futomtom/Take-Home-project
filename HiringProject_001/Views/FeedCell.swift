import NukeUI
import SwiftUI

struct FeedCell: View {
    let user: User
    let newsFeed: NewsFeed
    var body: some View {
        Color.sectionBackground
            .overlay(
                VStack {
                    topHeader()
                    feedContent()
                    footer()
                }
            )
            .frame(height: 480)
            .clipShape(
                RoundedRectangle(cornerRadius: 20)
            )
            .padding(.horizontal)
    }

    @MainActor
    private func topHeader() -> some View {
        HStack {
            RemoteAvatarImage(imageUrl: user.imageURL)
            VStack(alignment: .leading) {
                Text(user.fullName)
                    .boldStyling()
                Text(newsFeed.timeToNow)
                    .regularStyling(size: 10, color: .white)
            }
            Spacer()
            Button(action: {}, label: {
                Image(systemName: "ellipsis")
            })
        }
        .padding()
    }

    @MainActor
    private func feedContent() -> some View {
        Color.cellBackground
            .overlay(
                VStack {
                    RemoteImage(imageUrl: newsFeed.newsImageURL)
                }
            )
            .frame(height: 320)
            .clipShape(
                RoundedRectangle(cornerRadius: 20)
            )
            .padding(.horizontal)
    }

    private func footer() -> some View {
        let arr = ["hand.thumbsup", "doc.text", "square.and.arrow.up"]
        return HStack {
            ForEach(arr, id: \.self) { s in
                Button(action: {}, label: {
                    HStack {
                        Image(systemName: s)
                        Text("0")
                    }
                })
            }
            .padding()
        }
    }
}

#Preview {
    FeedCell(user: .mock, newsFeed: .mock)
}
