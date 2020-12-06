//
//  ProfileTableViewCell.swift
//  HobbyMe
//
//  Created by Matthew Serna on 12/5/20.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    weak var delegate: ProfileViewControllerDelegate?
    
    struct Constant {
        static let nibName = "ProfileTableViewCell"
        static let identifier = "profileTableViewCell"
    }
    
    struct Text {
        static let text = "Test"
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        let label = UILabel()
        label.text = Text.text
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
