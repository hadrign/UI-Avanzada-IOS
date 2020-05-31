//
//  TopicCell.swift
//  DiscourseClient
//
//  Created by Roberto Garrido on 08/02/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import UIKit

/// Celda que representa un topic en la lista
class TopicCell: UITableViewCell {
    
    
    @IBOutlet weak var lastPosterImage: UIImageView!
    @IBOutlet weak var titlePost: UILabel!
    @IBOutlet weak var postCount: UILabel!
    @IBOutlet weak var postersCount: UILabel!
    @IBOutlet weak var lastPostedAt: UILabel!
    
    let duration = 2.0
    
    var viewModel: TopicCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            lastPosterImage.layer.cornerRadius = 32
            titlePost.text = viewModel.titleTopic
            postersCount.text = String(viewModel.postersCount ?? 0)
            lastPostedAt.text = viewModel.lastPostedAt
            lastPosterImage?.image = viewModel.imageLastPoster
            postCount?.text = String(viewModel.postCount ?? 0)
            //Añadir imagen y el delegate para la imagen
        }
    }
}

extension TopicCell: TopicCellViewModelDelegate {
    func lastPosterImageFetched() {
        fadeOverImage()
        lastPosterImage?.image = viewModel?.imageLastPoster
        setNeedsLayout()
    }
    
    func fadeOverImage() {
        UIView.animate(withDuration: duration, delay: 0.0, animations: {  [weak self] in
            guard let self = self else { return }

            self.lastPosterImage.alpha = 0.0

        }) {  [weak self] (finished) in
            guard let self = self else { return }

            self.lastPosterImage.alpha = 1.0
        }
    }
}
