import Foundation

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

class PokemonSelectedApi {
    func getData(url: String, completion: @escaping (PokemonSelected) -> ()) {
        
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            
            let pokemonInformation = try! JSONDecoder().decode(PokemonSelected.self, from: data)
            
            DispatchQueue.main.async {
                completion(pokemonInformation)
            }
            
        }.resume()
    }
}
