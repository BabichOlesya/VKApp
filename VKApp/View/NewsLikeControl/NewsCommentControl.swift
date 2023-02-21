//
//  NewsCommentControl.swift
//  VKApp
//
//  Created by Олеся Бабич on 27.12.22..
//

import UIKit

class NewsCommentControl: UIControl {

    @IBOutlet var commentImage: UIImageView!
    @IBOutlet var commentLabel: UILabel!
    
    var isComment: Bool = false
    
    override func awakeFromNib() {
        commentImage.backgroundColor = .clear
        commentImage.tintColor = .systemGray6
        commentImage.image = UIImage(systemName: "message")
    }


}
