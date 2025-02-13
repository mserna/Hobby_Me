//
//  ProfileCell.swift
//  HobbyMe
//
//  Created by Matthew Serna.
//

import Foundation
import UIKit

class ProfileCell: FeedCell {
    
    override var profile: Profile? {
        didSet {
            titleLabel.text = profile?.username
            
            setupThumbnailImage()
            
            //setupProfileImage()
            
            //measure title text
            if let title = profile?.username {
                let size = CGSize(width: frame.width - 16 - 44 - 8 - 16, height: 1000)
                let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
                let estimatedRect = NSString(string: title).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], context: nil)
                
                if estimatedRect.size.height > 20 {
                    titleLabelHeightConstraint?.constant = 44
                } else {
                    titleLabelHeightConstraint?.constant = 20
                }
            }
            
            
        }
    }

    func setupProfileImage() {
        if let profileImageUrl = profile?.profileImageURL {
//            userProfileImageView.loadImageUsingUrlString(urlString: profileImageUrl)
            userProfileImageView.loadImageUsingName(imgStr: profileImageUrl)
        }
    }

    func setupThumbnailImage() {
        if let thumbnailImageUrl = profile?.thumbnailImageName {
//            thumbnailImageView.loadImageUsingUrlString(urlString: thumbnailImageUrl)
//            thumbnailImageView.loadImageUsingName(imgStr: thumbnailImageUrl)
        }
    }

//    let thumbnailImageView: CustomImageView = {
//        let imageView = CustomImageView()
//        imageView.image = UIImage(named: "1")
//        imageView.contentMode = .scaleAspectFill
//        imageView.clipsToBounds = true
//        return imageView
//    }()

    let userProfileImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.image = UIImage(named: "profile")
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        return view
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Matthew Serna"
        label.numberOfLines = 2
        return label
    }()

    let subtitleTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "Random user"
        textView.textContainerInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0)
        textView.textColor = UIColor.lightGray
        return textView
    }()

    var titleLabelHeightConstraint: NSLayoutConstraint?

    override func setupViews() {
        addSubview(separatorView)
        addSubview(userProfileImageView)
        addSubview(titleLabel)
        addSubview(subtitleTextView)
        
        addConstraintsWithFormat("H:|-16-[v0(100)]", views: userProfileImageView)
        
        //vertical constraints
        addConstraintsWithFormat("V:|-64-[v0(100)]-16-[v1(1)]|", views: titleLabel, separatorView)
        addConstraintsWithFormat("V:|-64-[v0(100)]-16-[v1(1)]|", views: userProfileImageView, separatorView)
        
        addConstraintsWithFormat("H:|[v0]|", views: separatorView)
        
        //top constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        //top constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 4))
        //left constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        //height constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 30))
    }
}
