//
//  LikeControl.swift
//  VKApp
//
//  Created by Олеся Бабич on 9.12.22..
//

import UIKit

class LikeControl: UIControl {
    @IBOutlet var likeImage: UIImageView!
    @IBOutlet var likeLabel: UILabel!
    
    
    var isLike: Bool = false
    
    override func awakeFromNib() {
        likeImage.backgroundColor = .clear
        likeImage.tintColor = .red
    }
    }
