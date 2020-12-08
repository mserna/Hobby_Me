//
//  DiscoverCell.swift
//  HobbyMe
//
//  Created by Matthew Serna on 12/7/20.
//

import Foundation
import UIKit

class DiscoverCell: FeedCell {
    
    override func fetchHobbies() {
        var hobbies = ApiManager.shared.fetchSomeHobbies()
        // Remove some hobbies for testing
        self.hobbies = hobbies
        self.collectionView.reloadData()
    }
}
