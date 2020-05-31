//
//  TopicCellViewModel.swift
//  DiscourseClient
//
//  Created by Roberto Garrido on 08/02/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import UIKit

protocol TopicCellViewModelDelegate: class {
    func lastPosterImageFetched()
}

/// ViewModel que representa un topic en la lista
class TopicCellViewModel: CellViewModel {
    weak var viewDelegate: TopicCellViewModelDelegate?
    let topic: Topic
    var titleTopic: String?
    var imageLastPoster: UIImage?
    var postCount: Int?
    var lastPostedAt: String?
    var postersCount: Int?
    
    init(topic: Topic, users: [UsersTopics]) {
        self.topic = topic
        self.titleTopic = topic.title
        self.postCount = topic.postsCount
        self.postersCount = topic.posters.count
        //Data Formatter
        let inputStringDate = topic.lastPostedAt
        let inputFormat = "YYYY-MM-dd'T'HH:mm:ss.SSSZ"
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "es_ES")
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        dateFormatter.dateFormat = inputFormat
        // Generar la fecha a partir del string y el formato de entrada
        guard let date = dateFormatter.date(from: inputStringDate) else { return }

        // Generar el string en el format de fecha requerido
        let outputFormat = "MMM dd"
        dateFormatter.dateFormat = outputFormat
        self.lastPostedAt = dateFormatter.string(from: date)
        
        // get avatar template
        //var avatarTemplateSelected = ""
        users.forEach({user in
            if user.username == topic.lastPosterUsername {
                //avatarTemplateSelected = user.avatarTemplate
                var urlDiscourse = "https://mdiscourse.keepcoding.io/"
                urlDiscourse.append(user.avatarTemplate.replacingOccurrences(of: "{size}", with: "70"))
                print(urlDiscourse)
                DispatchQueue.global(qos: .userInitiated).async { [weak self] in
                    if let url = URL(string: urlDiscourse), let data = try? Data(contentsOf: url) {
                        self?.imageLastPoster = UIImage(data: data)
                        DispatchQueue.main.async {
                            self?.viewDelegate?.lastPosterImageFetched()
                        }
                    }
                }
            }
        })
        
    }
}
