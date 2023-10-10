import UIKit
import SnapKit
import Then
import Kingfisher
import RxCocoa
import RxSwift

final class RandomPokemonViewController: UIViewController {
    
    private let randomPokemonInfoView = PokemonInfoView()
    
    private let randomButton = UIButton().then{
        $0.tintColor = UIColor.white
        $0.backgroundColor = .green
        $0.setTitle("Create Random Pokemon", for: .normal)
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.addTarget(self, action: #selector(randomButtonTapped), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configure()
        addSubView()
        setLayout()
        randomPokemon()
        
        randomButton.rx.tap
            .subscribe(onNext: {
                print("Observable이 항목을 방출했다!")
            })
    }
    
    private func configure(){
        self.navigationItem.title = "RandomPokemon"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func addSubView(){
        view.addSubview(randomPokemonInfoView)
        view.addSubview(randomButton)
    }
    
    private func setLayout(){
        self.randomPokemonInfoView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        self.randomButton.snp.makeConstraints{
            $0.height.equalTo(48)
            $0.width.equalTo(240)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(100)
            $0.centerX.equalTo(self.view.center)
        }
    }
    
    private func randomPokemon(){
        var randomNumber = Int.random(in: 1...151)
        
//        SelectedPokemonApi().getSelectedPokemonData(url: "https://pokeapi.co/api/v2/pokemon/\(randomNumber)", completion: { result in
//            
//            self.randomPokemonInfoView.setupView(pokemonImageUrl: result.sprites.front_default ?? "", id: result.id, name: result.name, weight: result.weight, height: result.height)
//        }
//        )
    }
    
    @objc private func randomButtonTapped() {
        randomPokemon()
    }
    
}

