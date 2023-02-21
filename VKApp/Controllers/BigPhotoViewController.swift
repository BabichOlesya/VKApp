//
//  BigPhotoViewController.swift
//  VKApp
//
//  Created by Олеся Бабич on 12.1.23..
//

import UIKit
import SDWebImage

class BigPhotoViewController: UIViewController {

    @IBOutlet weak var bigPhotoImage: UIImageView! {
        didSet {
            bigPhotoImage.isUserInteractionEnabled = true
        }
    }
    
    public var photos: [PhotoItem] = []
    public var photo: UIImage?
    public var selectedPhotoIndex: Int = 0
    
    private let additionaImageView = UIImageView()
    
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard !photos.isEmpty else { return }
        
        let photosUser = photos[selectedPhotoIndex].sizes

        if let photo = photosUser[selectedPhotoIndex].url {
            bigPhotoImage?.sd_setImage(with: URL(string: photo))
        }
//        bigPhotoImage.image = photosUser[selectedPhotoIndex]
        
//        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(leftSwipe))
//        leftSwipe.direction = .left
//        bigPhotoImage.addGestureRecognizer(leftSwipe)
        
//        view.addSubview(additionaImageView)
//        additionaImageView.translatesAutoresizingMaskIntoConstraints = false
//        view.sendSubviewToBack(additionaImageView)
//        additionaImageView.contentMode = .scaleAspectFit
//
//        NSLayoutConstraint.activate([
//            additionaImageView.leadingAnchor.constraint(equalTo: bigPhotoImage.leadingAnchor),
//            additionaImageView.trailingAnchor.constraint(equalTo: bigPhotoImage.trailingAnchor),
//            additionaImageView.topAnchor.constraint(equalTo: bigPhotoImage.topAnchor),
//            additionaImageView.bottomAnchor.constraint(equalTo: bigPhotoImage.bottomAnchor)
//        ])
    }
    
//    @objc func leftSwipe() {
//
//        guard selectedPhotoIndex + 1 <= photos.count - 1 else {
//
//            selectedPhotoIndex = 0
//            let photosUser = photos[selectedPhotoIndex].sizes
//
//            if let photo = photosUser[selectedPhotoIndex].url {
//                bigPhotoImage?.sd_setImage(with: URL(string: photo))
//            }
//            return
//        }
//
//        additionaImageView.transform = CGAffineTransform(translationX: 1.5*additionaImageView.bounds.width, y: 200).concatenating(CGAffineTransform(scaleX: 1.2, y: 1.2))
//        additionaImageView.image = photos[selectedPhotoIndex + 1].userPhoto
//
//
//        UIView.animate(withDuration: 0.8,
//                       delay: 0,
//                       options: .curveEaseIn) {
//            self.bigPhotoImage.transform = CGAffineTransform(translationX: -self.bigPhotoImage.bounds.width, y: -100).concatenating(CGAffineTransform(scaleX: 0.6, y: 0.6))
//
//            self.additionaImageView.transform = .identity
//
//        } completion: { _ in
//            self.selectedPhotoIndex += 1
//            self.bigPhotoImage.image = self.photos[self.selectedPhotoIndex].userPhoto
//            self.bigPhotoImage.transform = .identity
//
//            self.additionaImageView.image = nil
//        }
//
//    }
//
//    @IBAction func rigthSwipe(_ sender: Any) {
//
//        guard selectedPhotoIndex >= 1 else {
//
//            selectedPhotoIndex = photos.count - 1
//            bigPhotoImage.image = photos[selectedPhotoIndex].userPhoto
//            return
//        }
//
//        additionaImageView.transform = CGAffineTransform(translationX: -1.5*additionaImageView.bounds.width, y: 200).concatenating(CGAffineTransform(scaleX: 1.2, y: 1.2))
//        additionaImageView.image = photos[selectedPhotoIndex - 1].userPhoto
//
//        UIView.animate(withDuration: 0.8,
//                       delay: 0,
//                       options: .curveEaseIn) {
//            self.bigPhotoImage.transform = CGAffineTransform(translationX: self.bigPhotoImage.bounds.width, y: -100).concatenating(CGAffineTransform(scaleX: 0.6, y: 0.6))
//
//            self.additionaImageView.transform = .identity
//
//        } completion: { _ in
//            self.selectedPhotoIndex -= 1
//            self.bigPhotoImage.image = self.photos[self.selectedPhotoIndex].userPhoto
//            self.bigPhotoImage.transform = .identity
//
//            self.additionaImageView.image = nil
//        }
//
//    }
    
}

