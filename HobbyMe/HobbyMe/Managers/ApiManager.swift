//
//  ApiManager.swift
//  HobbyMe
//
//  Created by Matthew Serna.
//

import Foundation

class ApiManager: NSObject {
    
    static let shared = ApiManager()
    let baseUrl = ""
    
    func fetchHobbies() -> [Hobby] {
        guard let hobbies = fetchHobbiesFromURL(urlString: baseUrl) else {
            return []
        }
        return hobbies
    }
    
    func fetchSomeHobbies() -> [Hobby] {
        guard let hobbies = fetchHobbiesFromURL(urlString: baseUrl) else {
            return []
        }
        return Array(hobbies[0...1])
    }
    
    func fetchActivties() -> [Activity] {
        guard let activities = fetchActivitiesFromURL(urlString: baseUrl) else {
            return []
        }
        return activities
    }
    
    func fetchVideos(completion: @escaping ([Video]) -> ()) {
        fetchFeedForUrlString(urlString: "\(baseUrl)/home.json", completion: completion)
    }

    func fetchTrendingFeed(completion: @escaping ([Video]) -> ()) {
        fetchFeedForUrlString(urlString: "\(baseUrl)/trending.json", completion: completion)
    }

    func fetchSubscriptionFeed(completion: @escaping ([Video]) -> ()) {
        fetchFeedForUrlString(urlString: "\(baseUrl)/subscriptions.json", completion: completion)
    }

    func fetchFeedForUrlString(urlString: String, completion: @escaping ([Video]) -> ()) {
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in

            if error != nil {
                print(error ?? "")
                return
            }

            do {
                guard let data = data else { return }
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let videos = try decoder.decode([Video].self, from: data)

                DispatchQueue.main.async {
                    completion(videos)
                }

            } catch let jsonError {
                print(jsonError)
            }



            }.resume()
    }
    
    func fetchHobbiesFromURL(urlString: String) -> [Hobby]? {
        let basketball = Hobby(image: "basketball", hobbyName: "basketball", difficulty: 3)
        let chess = Hobby(image: "chess", hobbyName: "chess", difficulty: 8)
        let tennis = Hobby(image: "tennis", hobbyName: "tennis", difficulty: 6)
        let skateboarding = Hobby(image: "skate", hobbyName: "skate", difficulty: 10)
        var hobbyArray: [Hobby] = []
        hobbyArray.append(basketball)
        hobbyArray.append(chess)
        hobbyArray.append(tennis)
        hobbyArray.append(skateboarding)
        
        return hobbyArray
    }
    
    func fetchActivitiesFromURL(urlString: String) -> [Activity]? {
        let activity = Activity(name: "1v1 match", description: "1v1 tennis match", hobby: Hobby(image: "3", hobbyName: "tennis", difficulty: 6))
        var activityArray: [Activity] = []
        activityArray.append(activity)
        
        return activityArray
    }
    
    func fetchProfile() -> Profile {
        let profile = Profile(username: "Matthew Serna", profileImageURL: "profile", thumbnailImageName: "login", description: "Hi my name is Matt!")
        return profile
    }
    
}
