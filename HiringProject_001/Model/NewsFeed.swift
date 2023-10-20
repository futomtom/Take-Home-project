import Foundation

struct NewsFeed: Codable, Identifiable {
    let id: String
    let type: Int
    let subType: Int
    let title: String
    let text: String?
    let imageUrl: String
    let videoUrl: String?
    let authorUuid: String
    let repostUserUuid: String?
    let isRepost: Bool
    let timestamp: Date
    let repostTimestamp: String?
    let articleUrl: String
    let commentCount: Int?
    let likeCount: Int?
}

extension NewsFeed {
    var newsImageURL: URL? {
        URL(string: imageUrl)
    }

    var timeToNow: String {
        timestamp.formattedTimeUntilNow() +
            " ago"
    }
}

// MARK: Mock

extension NewsFeed {
    static var mock: NewsFeed = .init(
        id: "123",
        type: 2,
        subType: 2,
        title: "Chipmaker ASML raises full-year sales forecast as China demand stays strong",
        text: nil,
        imageUrl: "https://s.yimg.com/uu/api/res/1.2/pTdVoOgYTjXPgk_E5OGsbw--~B/aD0yOTM3O3c9NDQzNDthcHBpZD15dGFjaHlvbg--/https://s.yimg.com/os/creatr-uploaded-images/2023-07/6b9607e0-2614-11ee-afff-7cb7676f1edf",
        videoUrl: nil,
        authorUuid: "123",
        repostUserUuid: "123",
        isRepost: false,
        timestamp: Date(),
        repostTimestamp: nil,
        articleUrl: "https://finance.yahoo.com/news/forced-retire-60-firefighters-finances-040129459.html",
        commentCount: nil,
        likeCount: nil
    )
}
