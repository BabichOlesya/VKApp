//
//  FriendsCell.swift
//  VKApp
//
//  Created by Олеся Бабич on 16.11.22..
//

import UIKit
import SDWebImage

class FriendsCell: UITableViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    public var user: User?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func setup() {
        if let user = user {
            userNameLabel.text = user.lastName + " " + user.firstName
            
            if let photo = user.photoUser {
                userImageView?.sd_setImage(with: URL(string: photo))
            }
        }
        userImageView.contentMode = .scaleAspectFill
    }
        


}
