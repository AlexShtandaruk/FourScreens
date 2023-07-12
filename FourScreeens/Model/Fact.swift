import Foundation

struct Fact: Codable, Identifiable {
    
    var id: UUID?
    let fact: String?
}
