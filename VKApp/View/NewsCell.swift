//
//  NewsCell.swift
//  VKApp
//
//  Created by Олеся Бабич on 22.12.22..
//

import UIKit

class NewsCell: UITableViewCell {
    
    @IBOutlet weak var authorImage: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsLikeControl: NewsLikeControl!
    @IBOutlet weak var newsCommentControl: NewsCommentControl!
    @IBOutlet weak var newsShowControl: NewsShowControl!
    @IBOutlet weak var newsShareControl: NewsShareControl!
    @IBOutlet weak var newsTextView: UITextView!
    
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var containerMain: UIView!
    @IBOutlet weak var containerLike: UIView!
    @IBOutlet weak var containerComment: UIView!
    @IBOutlet weak var containerShow: UIView!
    @IBOutlet weak var containerShare: UIView!
    
    
    var likesCount = 0
    var commentCount = 0
    var showCount = 0
    var shareCount = 0
    
    override func awakeFromNib() {
        
        let likeTap = UITapGestureRecognizer(target: self, action: #selector(handleLikeTap))
        likeTap.numberOfTapsRequired = 2
        containerLike.addGestureRecognizer(likeTap)
        
        let commentTap = UITapGestureRecognizer(target: self, action: #selector(handleCommentTap))
        commentTap.numberOfTapsRequired = 1
        containerComment.addGestureRecognizer(commentTap)
        
        let showTap = UITapGestureRecognizer(target: self, action: #selector(handleShowTap))
        showTap.numberOfTapsRequired = 1
        containerShow.addGestureRecognizer(showTap)
        
        let shareTap = UITapGestureRecognizer(target: self, action: #selector(handleShareTap))
        shareTap.numberOfTapsRequired = 1
        containerShare.addGestureRecognizer(shareTap)
    }
    

    @objc func handleLikeTap(_ :UITapGestureRecognizer) {
        newsLikeControl.isLike.toggle()

        if newsLikeControl.isLike {
            newsLikeControl.likeImage.image = UIImage(systemName: "suit.heart.fill")
            newsLikeControl.likeLabel.text = String(likesCount + 1)
        } else {
            newsLikeControl.likeImage.image = nil
            if likesCount < 1 {
                newsLikeControl.likeLabel.text = nil
            } else {newsLikeControl.likeLabel.text = String(likesCount - 1)
            }

        }
    }
    
    @objc func handleCommentTap(_ :UITapGestureRecognizer) {
        newsCommentControl.isComment.toggle()

        if newsCommentControl.isComment {
            newsCommentControl.commentImage.tintColor = .systemGray4
            newsCommentControl.commentLabel.text = String(commentCount + 1)
        } else {
            newsCommentControl.commentImage.tintColor = .systemGray6
            newsCommentControl.commentLabel.text = nil
            if commentCount < 1 {
                newsCommentControl.commentLabel.text = nil
            } else {newsCommentControl.commentLabel.text = String(commentCount - 1)
            }

        }
    }
    
    @objc func handleShowTap(_ :UITapGestureRecognizer) {
        newsShowControl.isShow.toggle()

        if newsShowControl.isShow {
            newsShowControl.showImage.tintColor = .systemGray4
            newsShowControl.showLabel.text = String(showCount + 1)
        } else {
            newsShowControl.showImage.tintColor = .systemGray6
            newsShowControl.showLabel.text = nil
            if showCount < 1 {
                newsShowControl.showLabel.text = nil
            } else {newsShowControl.showLabel.text = String(showCount - 1)
            }

        }
    }
    
    @objc func handleShareTap(_ :UITapGestureRecognizer) {
        newsShareControl.isShare.toggle()

        if newsShareControl.isShare {
            newsShareControl.shareImage.tintColor = .systemGray4
            newsShareControl.shareLabel.text = String(shareCount + 1)
        } else {
            newsShareControl.shareImage.tintColor = .systemGray6
            newsShareControl.shareLabel.text = nil
            if showCount < 1 {
                newsShareControl.shareLabel.text = nil
            } else {newsShareControl.shareLabel.text = String(shareCount - 1)
            }

        }
    }
}
