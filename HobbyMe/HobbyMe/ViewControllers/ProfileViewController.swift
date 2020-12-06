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

protocol ProfileViewControllerDelegate: class {
    
}

class ProfileViewController: UIViewController {
    
    private var categories: [ContentSection] = []
    
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
