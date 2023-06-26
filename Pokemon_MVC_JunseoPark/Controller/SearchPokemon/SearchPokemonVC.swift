import UIKit
import SnapKit
import Then

final class SearchPokemonViewController: UIViewController {
    
    private let pokemonImage = UIImageView().then{
        $0.layer.cornerRadius = 100
    }
    
    private let idLabel = UILabel().then{
        $0.textColor = .black
    }
    
    private let nameLabel = UILabel().then{
        $0.textColor = .black
    }
    
    private let weightLabel = UILabel().then{
        $0.textColor = .black
    }
    
    private let heightLabel = UILabel().then{
        $0.textColor = .black
    }
    
    
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
        
        searchController.searchResultsUpdater = self
        
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    private func addSubView(){
        view.addSubview(pokemonImage)
        view.addSubview(nameLabel)
        view.addSubview(idLabel)
        view.addSubview(weightLabel)
        view.addSubview(heightLabel)
    }
    
    private func setLayout(){
        self.pokemonImage.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.centerX.equalTo(view.center)
            $0.height.width.equalTo(200)
        }
        self.idLabel.snp.makeConstraints{
            $0.top.equalTo(pokemonImage.snp.bottom).offset(20)
            $0.centerX.equalTo(view.center)
        }
        self.nameLabel.snp.makeConstraints{
            $0.top.equalTo(idLabel.snp.bottom).offset(20)
            $0.centerX.equalTo(view.center)
        }
        self.weightLabel.snp.makeConstraints{
            $0.top.equalTo(nameLabel.snp.bottom).offset(20)
            $0.centerX.equalTo(view.center)
        }
        self.heightLabel.snp.makeConstraints{
            $0.top.equalTo(weightLabel.snp.bottom).offset(20)
            $0.centerX.equalTo(view.center)
        }
    }
    
    func pokemonInfo(pokemonNumber: Int){
        SelectedPokemonApi().getSelectedPokemonData(url: "https://pokeapi.co/api/v2/pokemon/\(pokemonNumber)", completion: { result in
            
            self.pokemonImage.kf.setImage(with: URL(string: result.sprites.front_default!))
            self.idLabel.text = "고유번호 : \(result.id)"
            self.nameLabel.text = "이름 : \(result.name)"
            self.weightLabel.text = "무게 : \(result.weight/10)kg"
            self.heightLabel.text = "키 : \(result.height/10)m"
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
