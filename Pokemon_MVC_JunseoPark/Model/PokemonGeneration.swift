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

final class PokemonGenerationApi {
    func getPokemonGenerationData(url: String, completion: @escaping (PokemonGeneration) -> ()) {
        
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            
            let pokemonGenerationInfo = try! JSONDecoder().decode(PokemonGeneration.self, from: data)
            
            DispatchQueue.main.async {
                completion(pokemonGenerationInfo)
            }
            
            
        }.resume()
    }
}
