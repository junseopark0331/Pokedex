import UIKit
import SnapKit
import Then

class RandomPokemonViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        self.navigationItem.title = "RandomPokemon"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
    }
}

