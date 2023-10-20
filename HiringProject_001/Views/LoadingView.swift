import SwiftUI

struct LoadingView: View {
    @Environment(\.colorScheme) var colorScheme
    var isLoading: Bool

    private var isDarkMode: Bool {
        colorScheme == .dark
    }

    var body: some View {
        ZStack {
            if isLoading {
                VStack {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .background))
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(1.5)
                        .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(isLoading: true)
    }
}
