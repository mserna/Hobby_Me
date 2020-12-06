//
//  HomeViewController.swift
//  HobbyMe
//
//  Created by Matthew Serna on 12/5/20.
//

import UIKit
import SwiftUI

class HomeViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        // Setup background
        self.view.backgroundColor = .purple
         
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
        title.text = "Social Media Data"

        // Setup main button to go to social media platforms page
        let button = UIButton(frame: CGRect(x: 100 , y: 200, width: 200, height: 100))
        button.center.x = self.view.center.x
        button.center.y = self.view.center.y + 60.0
        button.layer.cornerRadius = 8
        title.layer.borderColor = UIColor.white.cgColor
        title.layer.borderWidth = 1
        title.layer.shadowColor = UIColor.lightGray.cgColor
        title.layer.shadowRadius = 0.5
        button.backgroundColor = .blue
        button.setTitle("Tap Here", for: .normal)

        // Setup note for help
        let note = UILabel(frame: CGRect(x: 100, y: 200, width: 200, height: 50))
        note.center.x = self.view.center.x
        note.center.y = self.view.center.y + 200.0
        note.textAlignment = .center
        note.textColor = .white
        note.adjustsFontSizeToFitWidth = true
        note.font = .italicSystemFont(ofSize: 30)
        note.backgroundColor = .purple
        note.text = "Shake phone to fetch data :)"

        self.view.addSubview(title)
        self.view.addSubview(button)
        self.view.addSubview(note)
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        // Testing
        switch item.title {
        case "Home":
            performSegue(withIdentifier: "home_seg", sender: nil)
        case "Profile":
            performSegue(withIdentifier: "profile_seg", sender: nil)
        default:
            break
        }
    }

    func loadCards() {
        
    }
}

struct Home: Codable {
    let name: String
}

struct Profile: Codable {
    let name: String
}
