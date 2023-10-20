import SwiftUI

struct RowView: View {
    let title: String
    let value: String

    init(title: String, value: String, shouldCapitalized: Bool = true) {
        self.title = title.capitalized
        self.value = shouldCapitalized ? value.capitalized : value
    }

    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .boldStyling()
                Spacer()
                Text(value)
                    .regularStyling()
            }
            Divider()
                .overlay(Color.blue)
        }
        .frame(height: 44)
    }
}

#Preview {
    RowView(title: "Company", value: "Location")
}
