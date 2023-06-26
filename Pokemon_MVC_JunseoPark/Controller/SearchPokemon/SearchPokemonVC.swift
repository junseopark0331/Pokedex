import UIKit
import SnapKit
import Then

final class SearchPokemonViewController: UIViewController {

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
//        self.navigationItem.accessibilityLabel = "Search Pokemon By Name"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    
}
