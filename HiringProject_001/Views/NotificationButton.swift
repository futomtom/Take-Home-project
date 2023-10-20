import SwiftUI

struct NotificationButton: View {
    var hasNewItems: Bool

    var body: some View {
        Button {} label: {
            ZStack {
                outline
                Image(systemName: "bell")
                    .foregroundColor(.secondary)
                    .font(.body)
            }
        }
    }

    var outline: some View {
        ZStack(alignment: .topTrailing) {
            Circle()
                .fill(.gray)
                .opacity(0.2)
                .frame(width: 44, height: 44)
            if hasNewItems {
                Circle()
                    .fill(.yellow)
                    .frame(width: 10, height: 10)
                    .offset(CGSize(width: 0.0, height: 5.0))
            }
        }
    }
}

#Preview("NewItems") {
    NotificationButton(hasNewItems: true)
}

#Preview("Default") {
    NotificationButton(hasNewItems: false)
}
