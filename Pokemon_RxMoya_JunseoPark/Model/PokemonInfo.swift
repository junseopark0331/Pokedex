import Foundation
import RxMoya

struct PokemonSelected: Codable {
    var sprites: PokemonSprites
    var id: Int
    var name: String
    var weight: Double
    var height: Double
}

struct PokemonSprites: Codable {
    var front_default: String?
}
