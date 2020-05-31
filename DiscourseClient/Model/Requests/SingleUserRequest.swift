//
//  SingleUserRequest.swift
//  DiscourseClient
//
//  Created by Hadrian Grille Negreira on 11/04/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation

// TODO: Implementar las propiedades de esta request
struct SingleUserRequest: APIRequest {
    
    typealias Response = SingleUserResponse
    
    let userName: String
    
    init(userName: String) {
        self.userName = userName
    }
    
    var method: Method {
        return .GET
    }
    
    var path: String {
        return "/users/\(self.userName).json"
    }
    
    var parameters: [String : String] {
        return [:]
    }
    
    var body: [String : Any] {
        [:]
    }
    
    var headers: [String : String] {
        [:]
    }
}
