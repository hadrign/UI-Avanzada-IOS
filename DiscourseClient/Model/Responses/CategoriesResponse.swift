//
//  CategoriesResponse.swift
//  DiscourseClient
//
//  Created by Hadrian Grille Negreira on 02/04/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation


struct CategoriesResponse: Codable {
    let categoryList: CategoryList
    enum CodingKeys: String, CodingKey {
        case categoryList = "category_list"
    }
}

struct CategoryList: Codable {
    let canCreateCategory: Bool
    let canCreateTopic: Bool
    var draft: Bool?
    let draftKey: String
    let draftSequence: Int
    let categories: [Category]
    enum CodingKeys: String, CodingKey {
        case canCreateCategory = "can_create_category"
        case canCreateTopic = "can_create_topic"
        case draft
        case draftKey = "draft_key"
        case draftSequence = "draft_sequence"
        case categories
    }
}

struct Category: Codable {
//    let id: Int
    let name: String
}
