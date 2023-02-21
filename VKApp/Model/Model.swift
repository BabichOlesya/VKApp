//
//  Model.swift
//  VKApp
//
//  Created by Олеся Бабич on 23.1.23..
//

import UIKit
import Realm
import RealmSwift

class JSONContactsResponce: Decodable {
    var response: Contacts
}

class Contacts: Decodable {
    var items: [User]
}

class User: Object, Decodable {
    convenience required init (from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.firstName = try container.decode(String.self, forKey: .firstName)
        self.lastName = try container.decode(String.self, forKey: .lastName)
        self.photoUser = try container.decode(String?.self, forKey: .photoUser)
//        self.birthDay = try container.decode(String?.self, forKey: .birthDay)
    }

    @Persisted (primaryKey: true) var id: Int = 0
//    @Persisted var id: Int = 0
    @Persisted var firstName: String = " "
    @Persisted var lastName: String = " "
    @Persisted var photoUser: String?
//    @Persisted var birthDay: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case photoUser = "photo_100"
//        case birthDay = "bdate"
    }
    
}

class JSONPhotosResponce: Decodable {
    var response: Photos
}

struct Photos: Decodable {
    var items: [PhotoItem]
}

class PhotoItem: Object, Decodable {
    
    @Persisted var ownerId: Int = 0
    @Persisted var photoID: Int? = 0
    @Persisted var sizes: List<Photo>
    
    enum CodingKeys: String, CodingKey {
        case ownerId = "owner_id"
        case photoID = "id"
        case sizes
    }
}

class Photo: Object, Decodable {
    @Persisted var url: String? = " "
}

class JSONGroupsResponce: Decodable {
    var response: Groups
}

class Groups: Decodable {
    var items: [MyGroup]
}

class MyGroup: Object, Decodable {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var name: String
    @Persisted var photoGroup: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case photoGroup = "photo_50"
    }
    
}

class JSONSearchGroupsResponce: Decodable {
    var response: Groups
}
