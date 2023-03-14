//
//  ServiceGetFriends.swift
//  VKApp
//
//  Created by Олеся Бабич on 1.3.23..
//

import Foundation
import Alamofire
import RealmSwift

class ServiceGetFriends{
    
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
    }
    
    private func saveToRealm(user: [User]){
        
        try! realm.write({
            realm.add(user)
        })
    }
//    func readRealm(){
//        let realm = try! Realm()
//
//        let user = realm.objects(User.self)
//
//    }
}
    
