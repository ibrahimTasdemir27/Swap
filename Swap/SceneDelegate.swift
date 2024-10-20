//
//  SceneDelegate.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 19.07.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = getRootViewController()
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
        window?.overrideUserInterfaceStyle = .light
    }

    private func getRootViewController() -> UIViewController {
        //let vc = RequestExchangeViewController.create()
        //let vc = HomeViewController.create()
        let vc = AdvertViewController.create(with: ProductCategory.allData())
        return wrapWithNavigationController(for: vc)
    }
    
    private func wrapWithNavigationController(for vc: UIViewController) -> UINavigationController {
        let navController = UINavigationController(rootViewController: vc)
        navController.navigationBar.isHidden = true
        navController.interactivePopGestureRecognizer?.isEnabled = false
        navController.view.backgroundColor = .white
        return navController
    }

}

