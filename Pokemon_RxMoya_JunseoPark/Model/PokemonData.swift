import Foundation
import RxMoya

struct Pokemon: Codable {
    var results: [PokemonData]
}

struct PokemonData: Codable, Identifiable {
    let id = UUID()
    var name: String?
    var url: String?
}
