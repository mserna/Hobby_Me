//
//  TestObject.swift
//  HobbyMe
//
//  Created by Matthew Serna on 12/6/20.
//

import UIKit

import Foundation
import UIKit

class TestObject: NSObject {

    var name: String
    
    lazy var someTestVar: TabBarController = { [unowned self] in
        let storyboard = UIStoryboard(name: "Home", bundle: Bundle.main)
        let tabBarController = storyboard.instantiateViewController(identifier: "TabBarController") as! TabBarController
        tabBarController.viewControllers = [
        ]

        return tabBarController
    }()

    init(name: String) {
        self.name = name
        super.init()
    }

    convenience init(random: Bool = false) {
            if random {
                let randomName = "Random"
                self.init(name: randomName)
            } else {

               self.init(name: "SomeName")
            }
        }
}
