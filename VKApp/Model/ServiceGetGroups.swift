//
//  ServiceGetGroups.swift
//  VKApp
//
//  Created by Олеся Бабич on 1.3.23..
//

import Foundation
import Alamofire
import RealmSwift

class ServiceGetGroups{
    
    let baseURL = "https://api.vk.com/method"
    let realm = try! Realm()
    
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
    
}
