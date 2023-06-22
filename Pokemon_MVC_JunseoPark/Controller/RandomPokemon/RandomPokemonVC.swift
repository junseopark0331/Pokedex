import UIKit
import SnapKit
import Then

class RandomPokemonViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configure()
        
        PokemonSelectedApi().getData(url: "https://pokeapi.co/api/v2/pokemon/\(1)/",
                                     completion: { result in
            
        })
    }
    
    private func configure(){
        self.navigationItem.title = "RandomPokemon"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}

