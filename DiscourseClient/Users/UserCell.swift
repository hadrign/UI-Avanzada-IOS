//
//  UserCell.swift
//  DiscourseClient
//
//  Created by Hadrian Grille Negreira on 11/04/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import UIKit

/// Celda que representa un topic en la lista
class UserCell: UITableViewCell {
    var viewModel: UserCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            viewModel.viewDelegate = self
            textLabel?.text = viewModel.textLabelText
            imageView?.image = viewModel.userImage
        }
    }
}

extension UserCell: UserCellViewModelViewDelegate {
    func userImageFetched() {
        imageView?.image = viewModel?.userImage
        setNeedsLayout()
    }
}
