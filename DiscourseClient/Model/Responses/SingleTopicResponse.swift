import Foundation

// TODO: Implementar aquí el modelo de la respuesta.
// Puedes echar un vistazo en https://docs.discourse.org

struct SingleTopicResponse: Codable {
    let id: Int
    let title: String
    let postsCount: Int
    let details: DetailsTopic
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case postsCount = "posts_count"
        case details
    }
}

struct DetailsTopic: Codable {
    var canDelete: Bool?
    enum CodingKeys: String, CodingKey {
        case canDelete = "can_delete"
    }
}
