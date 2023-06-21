import UIKit
import SnapKit
import Then

class PokemonListTableViewCell: UITableViewCell {
    
    static let identifier = "BeerListTableViewCell"
    
    let pokemonImage = UIImageView().then{
        $0.image = UIImage(named: "legend")
    }
    
    let pokemonNumberLabel = UILabel().then{
        $0.textColor = UIColor.orange
    }
    
    let pokemonNameLabel = UILabel().then{
        $0.textColor = UIColor.blue
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addContentView()
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addContentView() {
        contentView.addSubview(pokemonImage)
        contentView.addSubview(pokemonNumberLabel)
        contentView.addSubview(pokemonNameLabel)
    }
    
    
    private func autoLayout() {
        
        self.pokemonImage.snp.makeConstraints {
            $0.leading.top.equalTo(5)
            $0.size.width.height.equalTo(100)
        }
        
        self.pokemonNumberLabel.snp.makeConstraints {
            $0.leading.equalTo(pokemonImage.snp.trailing).offset(5)
            $0.top.equalTo(5)
            $0.trailing.equalTo(-5)
        }
        self.pokemonNameLabel.snp.makeConstraints{
            $0.leading.equalTo(pokemonImage.snp.trailing).offset(5)
            $0.top.equalTo(pokemonNumberLabel.snp.bottom).offset(10)
            $0.trailing.equalTo(-5)
        }
    }

}
