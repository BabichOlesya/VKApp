//
//  Service.swift
//  VKApp
//
//  Created by Олеся Бабич on 18.1.23..
//

import Foundation
import Alamofire
import RealmSwift

class Service{
    
    let baseURL = "https://api.vk.com/method"
    let realm = try! Realm()
    
    
    func getFriends(token: String, completion: @escaping ([User])->()) {
        let url = baseURL + "/friends.get"
        
        let parametrs: Parameters = [
            "access_token": token,
            "v":"5.131",
            "fields":"bdate, photo_100"
            
            
        ]

        AF.request(url, method: .get , parameters: parametrs).responseData { [self] result in
            guard let data = result.data else { return }
            let contacts = try! JSONDecoder().decode(JSONContactsResponce.self, from: data).response.items

                self.saveToRealm(user: contacts)
                completion(contacts)
            
            }
        
        print(realm.configuration.fileURL)
        }

    private func saveToRealm(user: [User]){
        
        try! realm.write({
            realm.add(user)
            print(self.realm.configuration.fileURL as Any)
        })
    }

    func readRealm(){
        let realm = try! Realm()

        let user = realm.objects(User.self)

    }

    
    
    func getPhotos(token: String, ownerId: Int, completion: @escaping ([PhotoItem])->()) {
        let url = baseURL + "/photos.get"
        
        let parametrs: Parameters = [
            "access_token": token,
            "v":"5.131",
            "album_id": "profile",
            "owner_id": ownerId
            
        ]
        
        AF.request(url, method: .get , parameters: parametrs).responseData { result in
            guard let data = result.data else { return }
            let photos = try! JSONDecoder().decode(JSONPhotosResponce.self, from: data).response.items

                self.saveToRealm(photo: photos)
                completion(photos)
            }
        }

    private func saveToRealm(photo: [PhotoItem]){
        let realm = try! Realm()

        try! realm.write({
            realm.add(photo)
        })
    }

    
    
    func getGroups(token: String, completion: @escaping ([MyGroup])->()) {
        let url = baseURL + "/groups.get"
        
        let parametrs: Parameters = [
            "access_token": token,
            "v":"5.131",
            "fields":"photo_50",
            "extended": 1
            
        ]
        
        AF.request(url, method: .get , parameters: parametrs).responseData { result in
            guard let data = result.data else { return }
            let groups = try! JSONDecoder().decode(JSONGroupsResponce.self, from: data).response.items

                self.saveToRealm(group: groups)
                completion(groups)
            }
        }

    private func saveToRealm(group: [MyGroup]){
        let realm = try! Realm()

        try! realm.write({
            realm.add(group)
        })
    }

    
    func getGroupsBySearch(token: String, q: String, completion: @escaping ([MyGroup])->()) {
        let url = baseURL + "/groups.search"
        
        let parametrs: Parameters = [
            "access_token": token,
            "v":"5.131",
            "count": "50",
            "q": q
        ]
        AF.request(url, method: .get, parameters: parametrs).responseData { result in
            if let data = result.data {
                if let searchGroups = try? JSONDecoder().decode(JSONSearchGroupsResponce.self, from: data).response.items {
                    completion(searchGroups)}
            }
        }

    }
    
}



