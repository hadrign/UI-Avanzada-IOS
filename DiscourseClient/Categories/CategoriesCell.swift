//
//  TopicCell.swift
//  DiscourseClient
//
//  Created by Hadrian Grille Negreira on 03/04/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import UIKit

/// Celda que representa un topic en la lista
class CategoriesCell: UITableViewCell {
    var viewModel: CategoriesCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            textLabel?.text = viewModel.textLabelText
        }
    }
}
