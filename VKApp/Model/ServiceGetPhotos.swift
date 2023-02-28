//
//  ServiceGetPhotos.swift
//  VKApp
//
//  Created by Олеся Бабич on 1.3.23..
//

import Foundation
import RealmSwift
import Alamofire

class ServiceGetPhotos{
    
    let baseURL = "https://api.vk.com/method"
    let realm = try! Realm()
    
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
    
}
