import SwiftUI

struct TwoButtons: View {
    var body: some View {
        HStack(spacing: 20) {
            Button(action: {}, label: {
                Text("Settings")
                    .boldStyling(size: 16)
            })
            .capsuleStyling()
            Button(action: {}, label: {
                Text("Edit Profile")
                    .boldStyling(size: 16)
            })
            .capsuleStyling()
        }
        .padding()
    }
}
