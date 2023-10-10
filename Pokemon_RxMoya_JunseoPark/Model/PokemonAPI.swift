import RxMoya
import Foundation
import Moya

enum PokemonAPI {
    case getPokemonData(id: Int)
    case getPokemonInfo(id: Int)
}

extension PokemonAPI: TargetType {
   
    var baseURL: URL {
        return URL(string: "https://pokeapi.co/api/v2/pokemon")!
    }
    
    var path: String {
        switch self {
        case .getPokemonData:
            return "/random"
        default:
            return ""
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        switch self {
            case let .getPokemonData(id):
                return .requestParameters(parameters: ["page": id], encoding: URLEncoding.queryString)
            case let .getPokemonInfo(id):
                return .requestParameters(parameters: ["ids": id], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
}
