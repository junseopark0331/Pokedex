import UIKit
import SnapKit
import Then
import Kingfisher
import RxSwift

final class SearchPokemonViewController: UIViewController {
    
    weak var searchBar: UISearchBar!
    
    private let searchPokemonInfoView = PokemonInfoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configure()
        addSubView()
        setLayout()
    }
    
    private func configure(){
        self.navigationItem.title = "Search Pokemon"
        self.navigationItem.accessibilityLabel = "Search Pokemon By ID"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Search Pokemon By ID"
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.searchTextField.keyboardType = .numberPad
        
        searchController.searchResultsUpdater = self
        
        searchController.searchResultsUpdater = self
        
        self.navigationItem.searchController = searchController
    }
    
    
    private func addSubView(){
        view.addSubview(searchPokemonInfoView)
    }
    
    
    private func setLayout(){
        self.searchPokemonInfoView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    
    func pokemonInfo(pokemonNumber: Int){
        SelectedPokemonApi().getSelectedPokemonData(url: "https://pokeapi.co/api/v2/pokemon/\(pokemonNumber)", completion: { [self] result in
            
            self.searchPokemonInfoView.setupView(
                pokemonImageUrl: result.sprites.front_default ?? "",
                id: result.id,
                name: result.name,
                weight: result.weight,
                height: result.height
            )
            
        }
        )
    }
    
}

extension SearchPokemonViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        var searchBarNumber = Int(searchController.searchBar.text ?? "")
        
        if let number = searchBarNumber {
            
            pokemonInfo(pokemonNumber: number)
            
            if number > 1010 {
                let alert = UIAlertController(title: "", message: "1010 이하의 숫자를 입력해주세요", preferredStyle: .alert )
                let defaultAction =  UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
                
                alert.addAction(defaultAction)
                self.present(alert, animated: true)
                
                searchController.searchBar.text = ""
            }
            
        } else {
//            pokemonInfo(pokemonNumber: searchBarNumber!)
        }
        
    }
    
}

extension SearchPokemonViewController: UISearchBarDelegate {
    
    func dismissKeyboard() {
        searchBar.resignFirstResponder()
    }
    
    func searchBarsearchButtonClicked(_ searchBar: UISearchBar){
        dismissKeyboard()
        guard let searchTerm = searchBar.text,
              searchTerm.isEmpty == false else {return}
    }
    
    func didPresentSearchController(_ searchController: UISearchController) {
        DispatchQueue.main.async {
            searchController.searchBar.becomeFirstResponder()
        }
    }
}

