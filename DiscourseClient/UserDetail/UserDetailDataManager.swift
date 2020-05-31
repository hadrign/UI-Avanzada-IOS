//
//  UserDetailDataManager.swift
//  DiscourseClient
//
//  Created by Hadrian Grille Negreira on 11/04/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation

protocol UserDetailDataManager: class {
    func fetchUser(userName: String, completion: @escaping (Result<SingleUserResponse?, Error>) -> ())
    
    func changeUserName(userName: String, newUserName: String, completion: @escaping (Result<ChangeUsernameResponse?, Error>) -> ())
}
