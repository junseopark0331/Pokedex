import Foundation

struct Pokemon: Codable {
    var results: [PokemonEntry]
}

struct PokemonEntry: Codable, Identifiable {
    let id = UUID()
    var name: String?
    var url: String?
}

final class PokemonListApi {
    
    func getPokemonListData(completion: @escaping ([PokemonEntry]) -> ()) {
        
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=151") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let ourData = data else {return}
            
            let pokemonList = try! JSONDecoder().decode(Pokemon.self, from: ourData)
            
            DispatchQueue.main.async {
                completion(pokemonList.results)
            }
            
        }.resume()
    }
}
