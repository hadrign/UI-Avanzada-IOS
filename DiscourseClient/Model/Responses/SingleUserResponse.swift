//
//  SingleUserResponse.swift
//  DiscourseClient
//
//  Created by Hadrian Grille Negreira on 11/04/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation

struct SingleUserResponse: Codable {
    let user: user
}

struct user: Codable {
    let id: Int
    let username: String
    let canEditUsername: Bool
    enum CodingKeys: String, CodingKey {
        case id
        case username = "name"
        case canEditUsername = "can_edit_name"
    }
}
