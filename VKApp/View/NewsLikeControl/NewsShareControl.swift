//
//  NewsShareControl.swift
//  VKApp
//
//  Created by Олеся Бабич on 27.12.22..
//

import UIKit

class NewsShareControl: UIControl {

    @IBOutlet var shareImage: UIImageView!
    @IBOutlet var shareLabel: UILabel!
    
    var isShare: Bool = false
    
    override func awakeFromNib() {
        shareImage.backgroundColor = .clear
        shareImage.tintColor = .systemGray6
        shareImage.image = UIImage(systemName: "arrowshape.turn.up.left")
    }

}
