//
//  UsersDataManager.swift
//  DiscourseClient
//
//  Created by Hadrian Grille Negreira on 11/04/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation

protocol UsersDataManager {
    func fetchAllUsers(completion: @escaping (Result<GetUsersResponse?, Error>) -> ())
}
