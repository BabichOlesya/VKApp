//
//  PhotoViewCell.swift
//  VKApp
//
//  Created by Олеся Бабич on 1.12.22..
//

import UIKit

class PhotoViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet var likeControl: LikeControl!
    @IBOutlet var container: UIView!
    
    var likesCount = 0

    
    override func awakeFromNib() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tap.numberOfTapsRequired = 2
        container.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(_ :UITapGestureRecognizer) {
        likeControl.isLike.toggle()
        
        if likeControl.isLike {
            likeControl.likeImage.image = UIImage(systemName: "suit.heart.fill")
//            likeControl.likeLabel.text = String(likesCount + 1)
            UIView.transition(with: self.likeControl.likeLabel, duration: 0.2, options: .transitionFlipFromTop, animations: {self.likeControl.likeLabel.text = String(self.likesCount + 1)})

        } else {
            likeControl.likeImage.image = nil
            if likesCount < 1 {
                likeControl.likeLabel.text = nil
            } else {
//                likeControl.likeLabel.text = String(likesCount - 1)
                UIView.transition(with: self.likeControl.likeLabel, duration: 0.2, options: .transitionFlipFromBottom, animations: {self.likeControl.likeLabel.text = String(self.likesCount - 1)})
            }

        }
    }
}
