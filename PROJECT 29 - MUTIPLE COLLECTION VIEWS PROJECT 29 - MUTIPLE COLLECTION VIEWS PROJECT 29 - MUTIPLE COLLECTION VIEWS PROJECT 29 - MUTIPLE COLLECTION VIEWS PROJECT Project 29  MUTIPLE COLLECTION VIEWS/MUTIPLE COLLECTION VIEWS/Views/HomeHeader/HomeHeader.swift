//
//  HomeHeader.swift
//  MUTIPLE COLLECTION VIEWS
//
//  Created by Nguyễn Trung Kiên on 28/11/2022.
//

import UIKit

class HomeHeader: UICollectionReusableView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!

    var info: [Note] = [Note.init(title: "Tokyo Ghoul", image: "soon-1"),
                        Note.init(title: "Record of Ragnarok", image: "soon-2"),
                        Note.init(title: "Kaisen Returns", image: "soon-3"),
                        Note.init(title: "No Idea", image: "soon-4"),
                        Note.init(title: "Looks interesting", image: "soon-5")]
//                        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let xib = UINib.init(nibName: "HeaderCell", bundle: nil)
        collectionView.register(xib, forCellWithReuseIdentifier: "HeaderCell")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return info.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderCell", for: indexPath) as! HeaderCell
//        cell.backgroundColor = indexPath.row % 2 == 0 ? UIColor.yellow : UIColor.gray
//        cell.imv.image = indexPath.row % 2 == 0 ? UIImage.init(named: "post1") : UIImage.init(named: "post2")
        cell.imv.image = UIImage(named: info[indexPath.row].image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.bounds.width
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
