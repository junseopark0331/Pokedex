//
//  SceneDelegate.swift
//  Beer_MVC_JunseoPark
//
//  Created by 박준서 on 2023/06/17.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
            guard let windowScene = (scene as? UIWindowScene) else { return }
            window = UIWindow(windowScene: windowScene) // SceneDelegate의 프로퍼티에 설정해줌
        
        window = UIWindow(windowScene: windowScene)
//        let nav = UINavigationController(rootViewController: TabbarViewController())
        let nav = TabbarViewController()
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        
        }

    func sceneDidDisconnect(_ scene: UIScene) {
        
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }

    func sceneWillResignActive(_ scene: UIScene) {
        
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    
    }


}

