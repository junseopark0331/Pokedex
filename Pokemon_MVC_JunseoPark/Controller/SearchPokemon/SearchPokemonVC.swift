import UIKit
import SnapKit
import Then

final class SearchPokemonViewController: UIViewController {
    
    weak var searchBar: UISearchBar!
    
    private let pokemonInfoView = PokemonInfoView(coder: <#NSCoder#>)
    
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
        view.addSubview(pokemonInfoView)
    }
    
    private func setLayout(){
        self.pokemonInfoView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    
    func pokemonInfo(pokemonNumber: Int){
        SelectedPokemonApi().getSelectedPokemonData(url: "https://pokeapi.co/api/v2/pokemon/\(pokemonNumber)", completion: { [self] result in
            
            self.pokemonInfoView.pokemonImage.kf.setImage(with: URL(string: result.sprites.front_default!))
            self.pokemonInfoView.idLabel.text = "고유번호 : \(result.id)"
            self.pokemonInfoView.nameLabel.text = "이름 : \(result.name)"
            self.pokemonInfoView.weightLabel.text = "무게 : \(result.weight/10)kg"
            self.pokemonInfoView.heightLabel.text = "키 : \(result.height/10)m"
        }
        )
    }
    
}

extension SearchPokemonViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        var pokemonNumber = Int(searchController.searchBar.text ?? "")
        
        if let number = pokemonNumber {
            pokemonInfo(pokemonNumber: number)
            
            if number > 1010 {
                let alert = UIAlertController(title: "", message: "1010 이하의 숫자를 입력해주세요", preferredStyle: .alert )
                let defaultAction =  UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
                
                alert.addAction(defaultAction)
                self.present(alert, animated: true)
                
                searchController.searchBar.text = ""
            }
            
        } else {
            print("오류")
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

