//
//  NewsShowControl.swift
//  VKApp
//
//  Created by Олеся Бабич on 27.12.22..
//

import UIKit

class NewsShowControl: UIControl {
    
    @IBOutlet var showImage: UIImageView!
    @IBOutlet var showLabel: UILabel!
    
    var isShow: Bool = false
    
    
    override func awakeFromNib() {
        showImage.backgroundColor = .clear
        showImage.tintColor = .systemGray6
        showImage.image = UIImage(systemName: "video")
    }

}
