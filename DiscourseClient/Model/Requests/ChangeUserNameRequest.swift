//
//  ChangeUserNameRequest.swift
//  DiscourseClient
//
//  Created by Hadrian Grille Negreira on 11/04/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation

struct ChangeUserNameRequest: APIRequest {
    
    typealias Response = ChangeUsernameResponse
    
    let userName: String
    let newUserName: String
    
    init(userName: String, newUserName: String) {
        self.userName = userName
        self.newUserName = newUserName
    }
    
    var method: Method {
        return .PUT
    }
    
    var path: String {
        //return "/users/\(self.userName)/preferences/username"
        //return "/users/\(self.userName)/preferences/username.json"
        return "/users/\(userName)"
    }
    
    var parameters: [String : String] {
        return [:]
    }
    
    var body: [String : Any] {
        return ["name": newUserName]
    }
    
    var headers: [String : String] {
        [:]
    }
}
