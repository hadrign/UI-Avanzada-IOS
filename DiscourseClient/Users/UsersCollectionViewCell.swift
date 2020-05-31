//
//  UsersCollectionViewCell.swift
//  DiscourseClient
//
//  Created by Hadrian Grille Negreira on 25/05/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import UIKit

class UsersCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    let duration = 2.0
    

    var viewModel: UserCellViewModel? {
            didSet {
                guard let viewModel = viewModel else { return }
                viewModel.viewDelegate = self
                userImage.layer.cornerRadius = 40
                userImage?.image = viewModel.userImage
                
                /*let attributedString = NSMutableAttributedString(string: viewModel.textLabelText ?? "")
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.lineSpacing = 0.3
                paragraphStyle.alignment = .center
                
                attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
                
                userName?.attributedText = attributedString*/
                userName?.text = viewModel.textLabelText
                
            }
    }

}

extension UsersCollectionViewCell: UserCellViewModelViewDelegate {
    func userImageFetched() {
        fadeOverImage()
        userImage?.image = viewModel?.userImage
        
        setNeedsLayout()
    }
    
    func fadeOverImage() {
        UIView.animate(withDuration: duration, delay: 0.0, animations: {  [weak self] in
            guard let self = self else { return }

            self.userImage.alpha = 0.0

        }) {  [weak self] (finished) in
            guard let self = self else { return }

            self.userImage.alpha = 1.0
        }
    }
}

