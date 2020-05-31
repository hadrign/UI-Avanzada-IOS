import Foundation

// TODO: Implementar aquí el modelo de la respuesta.
// Puedes echar un vistazo en https://docs.discourse.org

struct LatestTopicsResponse: Codable {
    let users: [UsersTopics]
    let topicList: LastedTopicsList
    
    enum CodingKeys: String, CodingKey {
        case users
        case topicList = "topic_list"
    }
}

struct UsersTopics: Codable {
    let username: String
    let avatarTemplate: String
    
    enum CodingKeys: String, CodingKey {
        case username
        case avatarTemplate = "avatar_template"
    }
}

struct LastedTopicsList: Codable {
    let canCreateTopic: Bool
    let draftKey: String
    let perPage: Int
    let topics: [Topic]
    enum CodingKeys: String, CodingKey {
        case canCreateTopic = "can_create_topic"
        case draftKey = "draft_key"
        case perPage = "per_page"
        case topics
    }
}

struct Topic: Codable {
    let id: Int
    let title: String
    let postsCount: Int
    let lastPostedAt: String
    let lastPosterUsername: String
    let posters: [Posters]
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case postsCount = "posts_count"
        case lastPostedAt = "last_posted_at"
        case lastPosterUsername = "last_poster_username"
        case posters
    }
}

struct Posters: Codable {
  
}
