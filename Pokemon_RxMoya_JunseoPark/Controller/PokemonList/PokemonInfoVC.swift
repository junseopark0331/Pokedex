import UIKit
import SnapKit
import Then
import Kingfisher

final class PokemonInformationViewController: UIViewController {
    
    var pokemonImageURL = ""
    var pokemonId = 0
    var pokemonName = ""
    var pokemonWeight: Double = 0
    var pokemonHeight: Double = 0
    
    private let detailPokemonInfoView = PokemonInfoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configure()
        addView()
        autoLayout()
        
    }
    
    private func configure(){
        self.detailPokemonInfoView.setupView(pokemonImageUrl: pokemonImageURL, id: pokemonId, name: pokemonName, weight: pokemonWeight, height: pokemonHeight)
    }
    
    private func addView(){
        view.addSubview(detailPokemonInfoView)
    }
    
    private func autoLayout(){
        self.detailPokemonInfoView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}
