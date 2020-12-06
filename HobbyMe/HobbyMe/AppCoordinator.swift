//
//  AppCoordinator.swift
//  HobbyMe
//
//  Created by HackinMac on 12/5/20.
//

import UIKit
import Foundation

class AppCoordinator: NSObject {
    
    var rootVC: UINavigationController
    var discoverVC: DiscoverCollectionViewController
    var profileVC: ProfileViewController
    
    lazy var tabBarController: TabBarController = { [unowned self] in
        let storyboard = UIStoryboard(name: "Home", bundle: Bundle.main)
        let tabBarController = storyboard.instantiateViewController(identifier: "TabBarController") as! TabBarController
        tabBarController.viewControllers = [
            discoverVC,
            profileVC
        ]

        return tabBarController
    }()
    
    init(window: UIWindow?) {
        guard let rootViewController = window?.rootViewController as? UINavigationController else {
            print("Root Controller not UINavigationController")
            return
        }
        
        rootVC = rootViewController
        rootVC.view.backgroundColor = UIColor.white
        rootVC.setNavigationBarHidden(true, animated: false)
        
        discoverVC = DiscoverCollectionViewController()
        profileVC = ProfileViewController()
        
        super.init()
    }
    
//    private func start() {
//        discoverVC.loadCards()
//    }
}
