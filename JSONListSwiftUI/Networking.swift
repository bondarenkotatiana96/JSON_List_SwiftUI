//
//  Networking.swift
//  JSONListSwiftUI
//
//  Created by user on 7/9/23.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case otherError
}

class NetworkManager: ObservableObject {
    @Published var users: [User] = []
    
    init() {
        // get data
        fetchUsers { result in
            switch result {
            case .success(let usersResult):
                DispatchQueue.main.async {
                    self.users = usersResult
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    // Getting users from JSON api
    func fetchUsers(completion: @escaping (Result<[User], NetworkError>) -> Void) {
        
        // URL
        guard let baseURL = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            completion(.failure(.badURL))
            return
        }
        
        // Make api call
        URLSession.shared.dataTask(with: baseURL) { data, _, error in
            // Handle errors
            if let error = error {
                completion(.failure(.otherError))
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else {
                completion(.failure(.otherError)) // No data
                return
            }
            
            // Decoding the data!!!
            do {
                // Getting users
                let usersResult = try JSONDecoder().decode([User].self, from: data)
                return completion(.success(usersResult))
            } catch {
                // Catch decoding errors
                return completion(.failure(.otherError)) // Was unable to decode data
            }
        }.resume()
    }
}
