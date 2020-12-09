//
//  FeedCell.swift
//  HobbyMe
//
//  Created by Matthew Serna.
//

import UIKit
import Foundation

class FeedCell: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
//    var videos: [Video]?
    
    var hobbies: [Hobby]?
    var profile: Profile?
    let cellId = "cellId"
    
//    func fetchVideos() {
//        ApiManager.shared.fetchVideos { (videos: [Video]) in
//
//            self.videos = videos
//            self.collectionView.reloadData()
//
//        }
//    }
    
    func fetchProfile() {
        let prof = ApiManager.shared.fetchProfile()
        self.profile = prof
        self.collectionView.reloadData()
    }
    
    func fetchHobbies() {
        //TODO: Get hobbies from API backend
        let hobbies = ApiManager.shared.fetchHobbies()
        self.hobbies = hobbies
        self.collectionView.reloadData()
    }
    
    override func setupViews() {
        super.setupViews()
        
//        fetchVideos()
        fetchProfile()
        fetchHobbies()
        
        backgroundColor = .brown
        
        collectionView.contentInset = .init(top: 50, left: 0, bottom: 0, right: 0)
        collectionView.scrollIndicatorInsets = .init(top: 50, left: 0, bottom: 0, right: 0)
        
        addSubview(collectionView)
        addConstraintsWithFormat("H:|[v0]|", views: collectionView)
        addConstraintsWithFormat("V:|[v0]|", views: collectionView)
        
//        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(HobbyCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hobbies?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! HobbyCell
        
        cell.hobby = hobbies?[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (frame.width - 16 - 16) * 9 / 16
        return .init(width: frame.width, height: height + 16 + 88)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let videoLauncher = VideoLauncher()
        guard let hobby = hobbies?[indexPath.item].hobbyName else {
            return
        }
        
        switch hobby {
        case "basketball":
            VideoURL.currentHobbyVid = VideoURL.basketball
            videoLauncher.showVideoPlayer()
        case "chess":
            VideoURL.currentHobbyVid = VideoURL.chess
            videoLauncher.showVideoPlayer()
        case "tennis":
            VideoURL.currentHobbyVid = VideoURL.tennis
            videoLauncher.showVideoPlayer()
        case "skate":
            VideoURL.currentHobbyVid = VideoURL.skate
            videoLauncher.showVideoPlayer()
        default:
            return
        }
    }
}
