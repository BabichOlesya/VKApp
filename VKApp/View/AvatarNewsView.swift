//
//  AvatarNewsView.swift
//  VKApp
//
//  Created by Олеся Бабич on 8.1.23..
//

import UIKit

class AvatarNewsView: UIView {
    @IBOutlet var avatarNewsImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        avatarNewsImageView.layer.shadowColor = UIColor.systemGray6.cgColor
        avatarNewsImageView.layer.shadowOffset = .zero
        avatarNewsImageView.layer.shadowRadius = 10
        avatarNewsImageView.layer.shadowOpacity = 0.6
    }
    
    
    override func layoutSubviews() {
        avatarNewsImageView.layer.cornerRadius = bounds.height/2
    }

}
