//
//  CategoriesCellViewModel.swift
//  DiscourseClient
//
//  Created by Hadrian Grille Negreira on 03/04/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation

class CategoriesCellViewModel {
    let categorie: Category
    var textLabelText: String?
    
    init(category: Category) {
        self.categorie = category
        self.textLabelText = category.name
        
        // TODO: Asignar textLabelText, el título de la category
    }
}
