//
//  TabBarController.swift
//  HobbyMe
//
//  Created by HackinMac on 12/5/20.
//

import Foundation

class TabBarController: UITabBarController {
    
    override var selectedIndex: Int {
        didSet {
            updateTabBarStackView()
        }
    }
    
    override var selectedViewController: UIViewController? {
        didSet {
            updateTabBarStackView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup
        
    }
    
    func updateTabBarStackView(animated: Bool = false) {
        
    }
}
