//
//  ContentView.swift
//  HiringProject_001
//
//  Created by Christopher Hicks on 7/17/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ProfileViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                VStack {
                    Profile(viewModel: viewModel)
                }
            }
            .onAppear {
                Task {
                    try? await viewModel.fetchProfile()
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Text("My Profile")
                        .regularStyling(size: 20, color: .primary)
                }

                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    NotificationButton(hasNewItems: true)
                    RemoteAvatarImage(imageUrl: viewModel.user.imageURL)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
