//
//  ContentView.swift
//  JSONListSwiftUI
//
//  Created by user on 7/9/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var dataManager = NetworkManager()
    var body: some View {
        List {
            // 10 elements
            ForEach(dataManager.users) { user in
                HStack {
                    Text(user.name)
                        .bold()
                    Spacer()
                    Text(user.email)
                }
            }
        }
    }
    
//    func getUsers() {
//        NetworkManager().fetchUsers { result in
//            switch result {
//            case .success(let users):
//                self.users = users
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
