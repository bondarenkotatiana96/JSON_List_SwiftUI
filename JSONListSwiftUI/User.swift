//
//  User.swift
//  JSONListSwiftUI
//
//  Created by user on 7/9/23.
//

import Foundation

// Model of a user
struct User: Identifiable, Decodable {
    var id: Int
    var name: String
    var email: String
}

//let users = [User(name: "Tanya"), User(name: "Misha"), User(name: "Natasha")]
