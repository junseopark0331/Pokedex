import UIKit
import SnapKit
import Then
import Kingfisher

class PokemonInfoView: UIView {
    
    init(
        pokemonImageUrl: String,
        id: String,
        name: String,
        weight: Double,
        height: Double
    )
    {
        super.init(frame: .zero)
        pokemonImage.kf.setImage(with: URL(string: pokemonImageUrl))
        idLabel.text = "고유번호 : \(id)"
        nameLabel.text = "이름 : \(name)"
        weightLabel.text = "무게 : \(weight/10)kg"
        heightLabel.text = "키 : \(height/10)m"
        
        addView()
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    let pokemonImage = UIImageView().then{
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 1
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
}

