import Foundation

struct StockLiftService {
    static func fetchNewsFeeds() async throws -> (Model) {
        let url = URL(string: "https://stocklift-dev.herokuapp.com/mock/mock_profile")!
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, 200 ... 299 ~= response.statusCode else {
            throw NetworkError.fetchFailure
        }

        let decoder = JSONDecoder.makeDecoder()

        do {
            let result = try decoder.decode(Model.self, from: data)
            return result
        } catch {

            throw NetworkError.decodeFailure
        }
    }
}
