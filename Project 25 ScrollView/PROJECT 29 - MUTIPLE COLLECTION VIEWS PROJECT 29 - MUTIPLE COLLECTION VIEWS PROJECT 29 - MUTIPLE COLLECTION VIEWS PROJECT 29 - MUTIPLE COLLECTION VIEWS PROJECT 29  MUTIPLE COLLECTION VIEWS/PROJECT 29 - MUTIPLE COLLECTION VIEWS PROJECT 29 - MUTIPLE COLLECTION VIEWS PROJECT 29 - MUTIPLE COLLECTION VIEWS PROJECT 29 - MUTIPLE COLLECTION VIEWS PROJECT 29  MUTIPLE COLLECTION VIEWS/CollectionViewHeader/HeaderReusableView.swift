//
//  HeaderReusableView.swift
//  PROJECT 29 - MUTIPLE COLLECTION VIEWS PROJECT 29 - MUTIPLE COLLECTION VIEWS PROJECT 29 - MUTIPLE COLLECTION VIEWS PROJECT 29 - MUTIPLE COLLECTION VIEWS PROJECT 29  MUTIPLE COLLECTION VIEWS
//
//  Created by Nguyễn Trung Kiên on 28/11/2022.
//

import UIKit

class HeaderReusableView: UICollectionReusableView,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var image: [Note] = [Note.init(title: "", image: "profile-1"),
                         Note.init(title: "", image: "profile-2"),
                         Note.init(title: "", image: "profile-3"),
                         Note.init(title: "", image: "profile-4"),
                         Note.init(title: "", image: "profile-5"),
                         Note.init(title: "", image: "profile-6"),
                         Note.init(title: "", image: "profile-7"),
                         Note.init(title: "", image: "profile-8")]
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let headerXib = UINib.init(nibName: "ImageHeaderViewCell", bundle: nil)
        collectionView.register(headerXib, forCellWithReuseIdentifier: "ImageHeaderViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return image.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageHeaderViewCell", for: indexPath) as! ImageHeaderViewCell
        
        cell.myImageView.image = UIImage.init(named: image[indexPath.row].image)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.frame.width
        let cellHeight = collectionView.bounds.height
        return CGSize.init(width: cellWidth, height: cellHeight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
