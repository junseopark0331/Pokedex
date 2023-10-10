import Foundation

struct PokemonGeneration: Codable {
    var id: Int
    var name: String
    var types: [PokemonType]
}

struct PokemonType: Codable{
    var name: String?
    var url: String?
}

