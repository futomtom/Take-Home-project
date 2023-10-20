import Foundation

struct User: Codable, Hashable {
    let uid: String
    let firstName: String
    let lastName: String
    let profileImageUrl: String
    let email: String
    let jobTitle: String
    let company: String
    let city: String
    let state: String
}

extension User {
    var imageURL: URL? {
        URL(string: profileImageUrl)
    }

    var fullName: String {
        "\(firstName) \(lastName)"
    }

    static var unknown: User = .init(
        uid: "",
        firstName: "",
        lastName: "",
        profileImageUrl: "",
        email: "",
        jobTitle: "",
        company: "",
        city: "",
        state: ""
    )

    static var mock: User {
        let urlString = "https://firebasestorage.googleapis.com:443/v0/b/stocklift-a871f.appspot.com/o/profile_images%2FC0483121-B4D3-4FA7-8483-9EFE1C2CADE8?alt=media&token=ecd96cb8-d0bd-41c5-9ded-dd4f94ed55af"

        return User(
            uid: "",
            firstName: "Alex",
            lastName: "Fu",
            profileImageUrl: urlString,
            email: "fualex3721@gmail.com",
            jobTitle: "",
            company: "Stocklift",
            city: "New York",
            state: "NY"
        )
    }
}
