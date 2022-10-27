//
//  UserModel.swift
//  TwitterClone
//
//  Created by Maertens Yann-Christophe on 26/10/22.
//

import Foundation

struct UserModel: Codable, Identifiable {
    let id = UUID()
    let username: String
    let hashtag: String
    let image: String
    var posts = [UserPost]()
    
    enum CodingKeys: String, CodingKey {
        case username, hashtag, image
    }
}

extension UserModel {
    static var all: [UserModel] { try! Bundle.main.decode("users.json") }
    static var example: UserModel { return all[0] }
}

struct UserPost: Codable {
    var message: String = ""
    var content: String = ""
    var views: Int = 0
    var comments = [UserPost]()
    var retweets: Int = 0
    var likes: Int = 0
}
