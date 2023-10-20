import Foundation

struct Model: Codable {
    let user: User?
    let newsfeed: [NewsFeed]

    init(user: User?, newsfeed: [NewsFeed]) {
        self.user = user
        self.newsfeed = newsfeed
    }
}

@MainActor
class ProfileViewModel: ObservableObject {
    @Published var user: User = .unknown
    @Published var newsFeeds = [NewsFeed]()

    func fetchProfile() async throws {
        let fetched = try await StockLiftService.fetchNewsFeeds()
        user = fetched.user ?? .unknown
        newsFeeds = fetched.newsfeed
    }
}

extension ProfileViewModel {
    static var mock: ProfileViewModel {
        let model = ProfileViewModel()
        model.user = .mock
        model.newsFeeds = [.mock]
        return model
    }
}
