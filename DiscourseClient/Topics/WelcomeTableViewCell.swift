//
//  WelcomeTableViewCell.swift
//  DiscourseClient
//
//  Created by Hadrian Grille Negreira on 31/05/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import UIKit

class WelcomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var internalView: UIView!
    
    
    var viewModel: WelcomeCellViewModel? {
        didSet {
            //guard let viewModel = viewModel else { return }
            internalView.backgroundColor = .tangerine
            internalView.layer.cornerRadius = 8
        }
    }
}
