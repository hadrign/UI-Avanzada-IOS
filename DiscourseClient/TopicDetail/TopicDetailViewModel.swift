//
//  TopicDetailViewModel.swift
//  DiscourseClient
//
//  Created by Roberto Garrido on 08/02/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation

/// Delegate que usaremos para comunicar eventos relativos a navegación, al coordinator correspondiente
protocol TopicDetailCoordinatorDelegate: class {
    func topicDetailBackButtonTapped()
    func topicDetailDeleteButtonTapped()
}

/// Delegate para comunicar a la vista cosas relacionadas con UI
protocol TopicDetailViewDelegate: class {
    func topicDetailFetched()
    func errorFetchingTopicDetail()
    func errorDeletingTopic()
}

class TopicDetailViewModel {
    var labelTopicIDText: String?
    var labelTopicNameText: String?
    var lableTopicNumberPostsText: String?
    var buttonCanDelete: Bool?

    weak var viewDelegate: TopicDetailViewDelegate?
    weak var coordinatorDelegate: TopicDetailCoordinatorDelegate?
    let topicDetailDataManager: TopicDetailDataManager
    let topicID: Int

    init(topicID: Int, topicDetailDataManager: TopicDetailDataManager) {
        self.topicID = topicID
        self.topicDetailDataManager = topicDetailDataManager
    }

    func viewDidLoad() {
        topicDetailDataManager.fetchTopic(id: self.topicID) {[weak self] (result) in
            switch result {
            case .success(let topicDetail):
                //Preguntar se esto no tendriamos que bloquear el hilo principal.
                guard let response = topicDetail else {return}
                self?.labelTopicIDText = String(response.id)
                self?.labelTopicNameText = response.title
                self?.lableTopicNumberPostsText = String(response.postsCount)
                if response.details.canDelete != nil {
                    self?.buttonCanDelete = response.details.canDelete
                } else {
                    self?.buttonCanDelete = false
                }
                
                self?.viewDelegate?.topicDetailFetched()
            case .failure(let error):
                print(error)
                self?.viewDelegate?.errorFetchingTopicDetail()
            }
            
        }
    }

    func backButtonTapped() {
        coordinatorDelegate?.topicDetailBackButtonTapped()
    }
    
    func deleteButtonTapped(ID: Int) {
        topicDetailDataManager.deleteTopic(id: ID) {[weak self] (result) in
            switch result {
            case .success(let topicDeleted):
                self?.coordinatorDelegate?.topicDetailDeleteButtonTapped()
            case .failure(let error):
                print(error)
                self?.viewDelegate?.errorDeletingTopic()
            }
            
        }
    }
    
}
