//
//  AppCoord.swift
//  HobbyMe
//
//  Created by Matthew Serna on 12/6/20.
//

import UIKit

class AppCoord: NSObject {
    
    let rootVC: UINavigationController
    var discoverVC: DiscoverCollectionViewController
    var profileVC: ProfileViewController
    
    init(window: UIWindow?) {
        guard let rootVC = window?.rootViewController as? UINavigationController else {
            print("Root Controller not UINavigationController")
            return
        }
        
        self.rootVC = rootVC
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
