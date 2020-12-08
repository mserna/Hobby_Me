//
//  ProfileCell.swift
//  HobbyMe
//
//  Created by Matthew Serna.
//

import Foundation
import UIKit

class ProfileCell: BaseCell {
    
//    func setupProfileImage() {
//        if let profileImageUrl = video?.channel?.profileImageName {
//            userProfileImageView.loadImageUsingUrlString(urlString: profileImageUrl)
//        }
//    }
    
    override func setupViews() {
        super.setupViews()
        addSubview(userProfileImageView)
        addConstraintsWithFormat("H:|-16-[v0(44)]", views: userProfileImageView)
        
//        //vertical constraints
//        addConstraintsWithFormat("V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: thumbnailImageView, userProfileImageView, separatorView)
    }
    
    let userProfileImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.image = UIImage(named: "login")
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
}
