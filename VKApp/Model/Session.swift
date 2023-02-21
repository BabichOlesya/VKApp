//
//  Session.swift
//  VKApp
//
//  Created by Олеся Бабич on 16.1.23..
//

import Foundation

class Session {
    private init() {}
    
    static var sharedInstance = Session()
    
    var token: String = ""
    var userID: String = ""
}
