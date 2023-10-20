import SwiftUI

struct UserInfoView: View {
    let user: User

    var body: some View {
        VStack {
            RowView(title: "Company", value: user.company)
            RowView(title: "Location", value: user.city)
            RowView(title: "Email", value: user.email.lowercased(), shouldCapitalized: false)
        }
        .padding()
    }
}

#Preview {
    UserInfoView(user: .mock)
}
