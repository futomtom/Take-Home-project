import SwiftUI

struct TwoButtons: View {
    var body: some View {
        HStack(spacing: 20) {
            Button(action: {}, label: {
                Text("Settings")
            })
            .capsuleStyling()
            Button(action: {}, label: {
                Text("Edit Profile")
            })
            .capsuleStyling()
        }
        .padding()
    }
}
