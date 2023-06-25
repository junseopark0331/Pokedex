import UIKit
import SnapKit
import Then

class SearchPokemonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configure()
    }
    
    private func configure(){
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Search Pokemon"
        self.navigationItem.searchController = searchController
        
        self.navigationItem.title = "Search Pokemon"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    
}
