//
//  ProfileViewController.swift
//  HobbyMe
//
//  Created by HackinMac on 12/5/20.
//

import UIKit

struct ContentSection {
    
    let title:String
    
    init?(_ dictionary: [String:Any]) {
        guard let title = dictionary["title"] as? String else {
            return nil
        }
        self.title = title
    }
}

class ProfileViewController: UIViewController {
    
    private var categories: [ContentSection] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup background
        self.view.backgroundColor = .white
         
        // Setup main title for application
        let title = UILabel(frame: CGRect(x: 100, y: 200, width: 200, height: 50))
        title.center.x = self.view.center.x
        title.center.y = self.view.center.y - 60.0
        title.layer.borderColor = UIColor.white.cgColor
        title.layer.borderWidth = 0.5
        title.layer.shadowColor = UIColor.lightGray.cgColor
        title.textAlignment = .center
        title.textColor = .white
        title.backgroundColor = .blue
        title.text = "Test Home Page"

        self.view.addSubview(title)
    }
}
