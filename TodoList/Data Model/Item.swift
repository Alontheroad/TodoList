import Foundation

// Encodable, Decodable ==> peut être remplacer par Codable
class Item: Codable {
    
    var title: String  = ""
    var done: Bool = false
}
