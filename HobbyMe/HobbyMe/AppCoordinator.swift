//
//  AppCoordinator.swift
//  HobbyMe
//
//  Created by HackinMac on 12/5/20.
//

import UIKit

final class AppCoordinator: NSObject {
    
    let rootVC: UINavigationController
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
    
    convenience init(random: Bool = false) {
        let win = UIWindow(frame: UIScreen.main.bounds)
        if random {
            self.init(window: win)
        } else {
            self.init(window: win)
        }
    }
    
    init(window: UIWindow?) {
        guard let root = window?.rootViewController as? UINavigationController else {
            preconditionFailure("Root controller not UINavigationController")
        }
        
        self.rootVC = root
        self.rootVC.view.backgroundColor = UIColor.white
        self.rootVC.setNavigationBarHidden(true, animated: false)

        self.discoverVC = DiscoverCollectionViewController()
        self.profileVC = ProfileViewController()

        super.init()
    }
    
    func start() {
        discoverVC.loadCards()
    }
}

extension AppCoordinator: UITabBarControllerDelegate {

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    }
}
