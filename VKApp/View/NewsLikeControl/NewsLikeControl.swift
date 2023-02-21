//
//  NewsControl.swift
//  VKApp
//
//  Created by Олеся Бабич on 20.12.22..
//

import UIKit

class NewsLikeControl: UIControl {
    @IBOutlet var likeImage: UIImageView!
    @IBOutlet var likeLabel: UILabel!
    
    var isLike: Bool = false
   
    
    override func awakeFromNib() {
        likeImage.backgroundColor = .clear
        likeImage.tintColor = .red
        
    }


}
