import UIKit
import SnapKit
import Then
import Kingfisher

class PokemonInfoView: UIView {
    
    let pokemonImage = UIImageView().then{
        $0.layer.cornerRadius = 100
    }
    
    let idLabel = UILabel().then{
        $0.textColor = .black
    }
    
    let nameLabel = UILabel().then{
        $0.textColor = .black
    }
    
    let weightLabel = UILabel().then{
        $0.textColor = .black
    }
    
    let heightLabel = UILabel().then{
        $0.textColor = .black
    }
    
    override func draw(_ rect: CGRect) {
        addView()
        autoLayout()
    }
    
    
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
    
    func setupView(
        pokemonImageUrl: String,
        id: Int,
        name: String,
        weight: Double,
        height: Double
    ) {
        DispatchQueue.main.async { // Change UI
            self.pokemonImage.kf.setImage(with: URL(string: pokemonImageUrl))
            self.idLabel.text = "고유번호 : \(id)"
            self.nameLabel.text = "이름 : \(name)"
            self.weightLabel.text = "무게 : \(weight/10)kg"
            self.heightLabel.text = "키 : \(height/10)m"
        }
        pokemonImage.layer.borderColor = UIColor.black.cgColor
        pokemonImage.layer.borderWidth = 1
        
    }
    
    
}

