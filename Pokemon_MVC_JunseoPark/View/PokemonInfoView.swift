import UIKit
import SnapKit
import Then
import Kingfisher

class PokemonInformationView: UIView {
    
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
    
    override func draw(_ rect: CGRect) {
        addView()
        autoLayout()
    }
    
//    func configure(model: Beer){
//        pokemonImage.kf.setImage(with: URL(string: model.pokemonImageURL))
//        idLabel.text = "고유번호 : \(model.pokemonId)"
//        nameLabel.text = "이름 : \(model.pokemonName)"
//        weightLabel.text = "무게 : \(model.pokemonWeight/10)kg"
//        heightLabel.text = "키 : \(model.pokemonHeight/10)m"
//    }
    
    private func addView(){
        addSubview(pokemonImage)
        addSubview(nameLabel)
        addSubview(idLabel)
        addSubview(weightLabel)
        addSubview(heightLabel)
    }
    
    private func autoLayout(){
        self.pokemonImage.snp.makeConstraints{
            $0.top.equalTo(self.safeAreaLayoutGuide)
            $0.centerX.equalTo(self.center)
            $0.height.width.equalTo(200)
        }
        self.idLabel.snp.makeConstraints{
            $0.top.equalTo(pokemonImage.snp.bottom).offset(20)
            $0.centerX.equalTo(self.center)
        }
        self.nameLabel.snp.makeConstraints{
            $0.top.equalTo(idLabel.snp.bottom).offset(20)
            $0.centerX.equalTo(self.center)
        }
        self.weightLabel.snp.makeConstraints{
            $0.top.equalTo(nameLabel.snp.bottom).offset(20)
            $0.centerX.equalTo(self.center)
        }
        self.heightLabel.snp.makeConstraints{
            $0.top.equalTo(weightLabel.snp.bottom).offset(20)
            $0.centerX.equalTo(self.center)
        }
    }
}

