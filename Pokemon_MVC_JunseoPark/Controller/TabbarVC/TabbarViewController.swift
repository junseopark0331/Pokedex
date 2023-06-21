import UIKit
import SnapKit
import Then

class TabbarViewController: UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let beerListVC = UINavigationController(rootViewController: PokemonListViewController())
        beerListVC.tabBarItem.title = "PokemonList"
        beerListVC.tabBarItem.image = UIImage(systemName: "1.circle")
        beerListVC.tabBarItem.selectedImage = UIImage(systemName: "1.circle.fill")
        
        let searchBeerVC = UINavigationController(rootViewController: SearchPokemonViewController())
        searchBeerVC.tabBarItem.title = "SearchPokemon"
        searchBeerVC.tabBarItem.image = UIImage(systemName: "2.circle")
        searchBeerVC.tabBarItem.selectedImage = UIImage(systemName: "2.circle.fill")
        
        let randomBeerVC = UINavigationController(rootViewController: RandomPokemonViewController())
        randomBeerVC.tabBarItem.title = "RandomPokemon"
        randomBeerVC.tabBarItem.image = UIImage(systemName: "3.circle")
        randomBeerVC.tabBarItem.selectedImage = UIImage(systemName: "3.circle.fill")
        
        viewControllers = [beerListVC, searchBeerVC, randomBeerVC]
    }
    
}
