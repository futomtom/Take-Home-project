import SwiftUI

struct ProfileHeader: View {
    let user: User
    var body: some View {
        Color.sectionBackground
            .overlay(
                VStack {
                    nameJobView()
                    UserInfoView(user: user)
                    TwoButtons()
                }
            )
            .frame(height: 440)
            .clipShape(.rect(cornerRadius: 20))
            .padding(.horizontal)
    }

    private func nameJobView() -> some View {
        HStack(alignment: .center) {
            Spacer()
            VStack(spacing: 10) {
                Text(user.fullName)
                    .boldStyling(size: 30)
                Text("Financial Advisor")
                    .regularStyling(size: 14)
            }
            Spacer()
        }
        .padding(.top, 100)
    }
}

#Preview {
    ProfileHeader(user: .mock)
}
