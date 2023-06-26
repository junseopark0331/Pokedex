import UIKit
import SnapKit
import Then
import Kingfisher

final class RandomPokemonViewController: UIViewController {
    
    private let pokemonImage = UIImageView().then{
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 1
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
    }
    
    private func configure(){
        self.navigationItem.title = "RandomPokemon"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func addSubView(){
        view.addSubview(pokemonImage)
        view.addSubview(nameLabel)
        view.addSubview(idLabel)
        view.addSubview(weightLabel)
        view.addSubview(heightLabel)
        view.addSubview(randomButton)
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
        self.randomButton.snp.makeConstraints{
            $0.height.equalTo(48)
            $0.width.equalTo(240)
            $0.top.equalTo(heightLabel.snp.bottom).offset(100)
            $0.centerX.equalTo(self.view.center)
        }
    }
    
    private func randomPokemon(){
        var randomNumber = Int.random(in: 1...151)
        
        SelectedPokemonApi().getSelectedPokemonData(url: "https://pokeapi.co/api/v2/pokemon/\(randomNumber)", completion: { result in
            
            self.pokemonImage.kf.setImage(with: URL(string: result.sprites.front_default!))
            self.idLabel.text = "고유번호 : \(result.id)"
            self.nameLabel.text = "이름 : \(result.name)"
            self.weightLabel.text = "무게 : \(result.weight/10)kg"
            self.heightLabel.text = "키 : \(result.height/10)m"
        }
        )
    }
    
    @objc private func randomButtonTapped() {
        randomPokemon()
    }
    
}

