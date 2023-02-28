//
//  AvatarView.swift
//  VKApp
//
//  Created by Олеся Бабич on 8.12.22..
//

import UIKit

@IBDesignable

class AvatarView: UIView {
    @IBOutlet var avatarImageView: UIImageView!
    @IBOutlet var shadowView: UIView!

    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        let animateTap = UITapGestureRecognizer(target: self, action: #selector(animateAvatar))
        animateTap.numberOfTapsRequired = 1
        self.addGestureRecognizer(animateTap)
        
        shadowView.layer.shadowColor = UIColor.systemBlue.cgColor
        shadowView.layer.shadowOffset = .zero
        shadowView.layer.shadowRadius = 10
        shadowView.layer.shadowOpacity = 0.6
    }
    
    
    override func layoutSubviews() {
        avatarImageView.layer.cornerRadius = bounds.height/2
        shadowView.layer.cornerRadius = bounds.height/2
    }
    
    
    @objc func animateAvatar() {
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       animations: { self.avatarImageView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }) { _ in
            UIView.animate(withDuration: 0.3,
                           animations: { self.avatarImageView.transform = CGAffineTransform.identity
            })
        }
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       animations: { self.shadowView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }) { _ in
            UIView.animate(withDuration: 0.3,
                           animations: {self.shadowView.transform = CGAffineTransform.identity
            })
        }
    }

}

