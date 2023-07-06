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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configure()
        addView()
        autoLayout()
        
    }
    
    private func configure(){
        pokemonImage.kf.setImage(with: URL(string: pokemonImageURL))
        idLabel.text = "고유번호 : \(pokemonId)"
        nameLabel.text = "이름 : \(pokemonName)"
        weightLabel.text = "무게 : \(pokemonWeight/10)kg"
        heightLabel.text = "키 : \(pokemonHeight/10)m"
    }
    
    private func addView(){
        view.addSubview(pokemonImage)
        view.addSubview(nameLabel)
        view.addSubview(idLabel)
        view.addSubview(weightLabel)
        view.addSubview(heightLabel)
    }
    
    private func autoLayout(){
        self.pokemonImage.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide)
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
}
