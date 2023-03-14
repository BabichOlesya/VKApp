//
//  ServiceGetGroupBySearch.swift
//  VKApp
//
//  Created by Олеся Бабич on 1.3.23..
//

import Foundation
import Alamofire
import RealmSwift

class ServiceGetGroupBySearch{
    
    let baseURL = "https://api.vk.com/method"
    let realm = try! Realm()
    
    func getGroupsBySearch(token: String, q: String, completion: @escaping ([MyGroup])->()) {
        let url = baseURL + "/groups.search"
        
        let parametrs: Parameters = [
            "access_token": token,
            "v":"5.131",
            "count": "50",
            "q": q
        ]
        
        AF.request(url, method: .get, parameters: parametrs).responseData { result in
            guard let data = result.data else { return }
            let searchGroups = try! JSONDecoder().decode(JSONSearchGroupsResponce.self, from: data).response.items
            
            self.saveToRealm(searchGroup: searchGroups)
            completion(searchGroups)
        
                    }
                }
    private func saveToRealm(searchGroup: [MyGroup]){
        let realm = try! Realm()
        
        try! realm.write({
            realm.add(searchGroup)
        })
    }
    
}
