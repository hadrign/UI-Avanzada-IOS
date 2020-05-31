//
//  CategoriesDataManager.swift
//  DiscourseClient
//
//  Created by Hadrian Grille Negreira on 03/04/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation

// Errores que pueden darse en el categories data manager
enum CategoriesDataManagerError: Error {
    case unknown
}

/// Data Manager con las operaciones necesarias de este módulo
protocol CategoriesDataManager {
    func fetchAllCategories(completion: @escaping (Result<CategoriesResponse?, Error>) -> ())
}
