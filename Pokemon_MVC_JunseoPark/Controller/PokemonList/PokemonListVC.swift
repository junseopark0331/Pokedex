import UIKit
import SnapKit
import Then
import Kingfisher

final class PokemonListViewController: UIViewController {
    
    var pokemon = [PokemonEntry]()
    
    
    private let tableView = UITableView().then{
        $0.register(PokemonListTableViewCell.self, forCellReuseIdentifier: PokemonListTableViewCell.identifier)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configure()
        addView()
        autoLayout()
        
    }
    private func configure(){
        self.navigationItem.title = "PokemonList"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 100
    }
    
    private func addView(){
        view.addSubview(tableView)
    }
    
    private func autoLayout(){
        self.tableView.snp.makeConstraints{
            $0.top.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
}

extension PokemonListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 151
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PokemonListTableViewCell.identifier, for: indexPath) as! PokemonListTableViewCell
        cell.pokemonNumberLabel.text = "\(indexPath.row + 1)"
        cell.pokemonImage.kf.setImage(with: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(indexPath.row + 1).png"))

        
        PokemonListApi().getPokemonListData(completion: { url in
            cell.pokemonNameLabel.text = url[indexPath.row].name
        })
        
        return cell
    }
    
}

extension PokemonListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        SelectedPokemonApi().getSelectedPokemonData(url: "https://pokeapi.co/api/v2/pokemon/\(indexPath.row + 1)/",
                                     completion: { result in
            
            let pokemonInfoVC = PokemonInformationViewController()
            
            pokemonInfoVC.pokemonImageURL = result.sprites.front_default ?? ""
            pokemonInfoVC.pokemonName = result.name
            pokemonInfoVC.pokemonId = result.id
            pokemonInfoVC.pokemonWeight = result.weight
            pokemonInfoVC.pokemonHeight = result.height

             self.navigationController?.pushViewController(pokemonInfoVC, animated: true)
            
        })

    }
    
}
                        
