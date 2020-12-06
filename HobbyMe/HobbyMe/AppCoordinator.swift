//
//  AppCoordinator.swift
//  HobbyMe
//
//  Created by HackinMac on 12/5/20.
//

import Foundation
import UIKit

class AppCoordinator: NSObject {
    
    let rootVC: UINavigationController
    let discoverVC: DiscoverCollectionViewController
    let profileVC: ProfileViewController
    
    lazy var tabBarController: TabBarController = { [unowned self] in
        let storyboard = UIStoryboard(name: "Home", bundle: Bundle.main)
        let tabBarController = storyboard.instantiateViewController(identifier: "TabBarController") as! TabBarController
        tabBarController.viewControllers = [
            
        ]
        tabBarController.delegate = self
    }
    
    init(window: UIWIndow?) {
        // Load TabBarViewController and HomeViewController
        start()
    }
    
    private func start() {
        let homeVC = HomeViewController()
        homeVC.loadCards()
    }
}
