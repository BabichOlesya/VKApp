//
//  FriendPhotoViewController.swift
//  VKApp
//
//  Created by Олеся Бабич on 30.11.22..
//

import UIKit
import SDWebImage


class FriendPhotoViewController: UICollectionViewController {
    
    let session = Session.sharedInstance
    let service = ServiceGetPhotos()
    var userPhotos: [PhotoItem] = []
    var ownerId: Int!

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        service.getPhotos(token: session.token, ownerId: ownerId) { [self] photos in
            self.userPhotos = photos

            self.collectionView.reloadData()
        }

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userPhotos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoViewCell
        
        let photos = userPhotos[indexPath.item].sizes

        if let photo = photos[indexPath.item].url {
            cell.photoImageView?.sd_setImage(with: URL(string: photo))
        }
        
        cell.photoImageView.contentMode = .scaleAspectFill
        
        return cell
    }

}

extension FriendPhotoViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showBigPhoto",
           let selectPhoto = collectionView.indexPathsForSelectedItems?.first,
           let bigPhotoVC = segue.destination as? BigPhotoViewController{
            
            bigPhotoVC.photos = userPhotos
            bigPhotoVC.selectedPhotoIndex = selectPhoto.item
        }
    }
}
