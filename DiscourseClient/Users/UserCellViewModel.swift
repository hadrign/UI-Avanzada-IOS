//
//  UserCellViewModel.swift
//  DiscourseClient
//
//  Created by Hadrian Grille Negreira on 11/04/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation
import UIKit

protocol UserCellViewModelViewDelegate: class {
    func userImageFetched()
}

class UserCellViewModel {
    weak var viewDelegate: UserCellViewModelViewDelegate?
    let user: User
    var textLabelText: String?
    var urlAvatar: String?
    var userImage: UIImage?
    
    init(user: User) {
        self.user = user
        self.textLabelText = user.name
        
        var urlDiscourse = "https://mdiscourse.keepcoding.io/"
        urlDiscourse.append(user.avatarTemplate.replacingOccurrences(of: "{size}", with: "100"))
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            if let url = URL(string: urlDiscourse), let data = try? Data(contentsOf: url) {
                self?.userImage = UIImage(data: data)
                DispatchQueue.main.async {
                    self?.viewDelegate?.userImageFetched()
                }
            }
        }
    }
}
