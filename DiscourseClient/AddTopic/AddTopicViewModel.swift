//
//  AddTopicViewModel.swift
//  DiscourseClient
//
//  Created by Roberto Garrido on 08/02/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation

/// Delegate para comunicar aspectos relacionados con navegación
protocol AddTopicCoordinatorDelegate: class {
    func addTopicCancelButtonTapped()
    func topicSuccessfullyAdded()
}

/// Delegate para comunicar a la vista aspectos relacionados con UI
protocol AddTopicViewDelegate: class {
    func errorAddingTopic()
}

class AddTopicViewModel {
    weak var viewDelegate: AddTopicViewDelegate?
    weak var coordinatorDelegate: AddTopicCoordinatorDelegate?
    let dataManager: AddTopicDataManager

    init(dataManager: AddTopicDataManager) {
        self.dataManager = dataManager
    }

    func cancelButtonTapped() {
        coordinatorDelegate?.addTopicCancelButtonTapped()
    }

    func submitButtonTapped(title: String) {
        self.dataManager.addTopic(title: title, raw: title + " este es el título del topic creado", createdAt: "hadrign") {[weak self] (result) in
            switch result{
            case .success(let newTopicAdded):
                print(newTopicAdded?.id ?? 0)
                self?.coordinatorDelegate?.topicSuccessfullyAdded()
            case .failure(let error):
                print("error en repintar table después de crear topic")
                print(error)
                self?.viewDelegate?.errorAddingTopic()
            }
            
        }
    }
}
