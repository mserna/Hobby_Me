//
//  LaunchViewController.swift
//  HobbyMe
//
//  Created by Matthew Serna on 12/5/20.
//

import UIKit

class LaunchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadLaunchUI()
    }
    
    func loadLaunchUI() {
        // Setup background
        self.view.backgroundColor = .green
        
        // Setup main title for application
        let title = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        title.center.x = self.view.center.x
        title.center.y = self.view.center.y - 60.0
        title.layer.borderColor = UIColor.white.cgColor
        title.layer.borderWidth = 0.5
        title.layer.shadowColor = UIColor.lightGray.cgColor
        title.textAlignment = .center
        title.textColor = .white
        title.text = "Hobby Me"
    }

}
