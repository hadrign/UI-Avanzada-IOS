//
//  GetUsersRequest.swift
//  DiscourseClient
//
//  Created by Hadrian Grille Negreira on 11/04/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation

/// Implementación de la request que obtiene los latest topics
struct GetUsersRequest: APIRequest {
    
    typealias Response = GetUsersResponse
    
    var method: Method {
        return .GET
    }
    
    var path: String {
        return "/directory_items.json"
        //return "/directory_items.json?period=all&order=likes_received"
    }
    
    var parameters: [String : String] {
        return ["period":"all",
                "order":"likes_received"]
        //return[:]
    }
    
    var body: [String : Any] {
        return [:]
    }
    
    var headers: [String : String] {
        return [:]
    }

}
