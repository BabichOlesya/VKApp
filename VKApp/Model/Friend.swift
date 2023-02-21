//
//  Friend.swift
//  VKApp
//
//  Created by Олеся Бабич on 29.11.22..
//

import UIKit

public struct Friend {
    var userName: String
    var userPhoto: UIImage?
    var userfriends: [NewFriend]
}

public struct NewFriend {
    var userName: String
    var userPhoto: UIImage?
}
