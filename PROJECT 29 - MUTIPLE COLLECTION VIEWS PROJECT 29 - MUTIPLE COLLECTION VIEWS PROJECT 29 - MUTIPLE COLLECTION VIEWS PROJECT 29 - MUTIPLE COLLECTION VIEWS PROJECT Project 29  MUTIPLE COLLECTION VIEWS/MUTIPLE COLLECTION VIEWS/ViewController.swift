//
//  ViewController.swift
//  MUTIPLE COLLECTION VIEWS
//
//  Created by Nguyễn Trung Kiên on 28/11/2022.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!

    var note: [Note] =  [Note.init(title: "Naruto", image: "profile-1"),
                        Note.init(title: "sukuna", image: "profile-2"),
                                                  Note.init(title: "kakashi", image: "profile-3"),
                                                  Note.init(title: "tanjiro", image: "profile-4"),
                                                  Note.init(title: "nezuko", image: "profile-5"),
                                                  Note.init(title: " Two colo", image: "profile-6"),
                                                  Note.init(title: "kilua", image: "profile-7"),
                                                  Note.init(title: "bach tang", image: "profile-8")]
    
    let cellId: String = "HomeCell"
    let cellSpace: CGFloat =  8
    let column: CGFloat = 2
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Register cell
        let xib = UINib.init(nibName: cellId, bundle: nil)
        collectionView.register(xib, forCellWithReuseIdentifier: cellId)
        
        // Register Header
        let headerXib = UINib.init(nibName: "HomeHeader", bundle: nil)
        collectionView.register(headerXib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HomeHeader")
        
        // Content inset
        collectionView.contentInset = UIEdgeInsets.init(top: cellSpace, left: cellSpace, bottom: cellSpace, right: cellSpace)
        
        // delegate
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return note.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HomeCell
//        cell.backgroundColor = indexPath.row % 2 == 0 ? UIColor.red : UIColor.blue
        cell.myImageView.image = UIImage(named: note[indexPath.row].image)
        cell.txtLabel.text = note[indexPath.row].title
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (collectionView.bounds.width - cellSpace * (column + 1)) / column
        let cellHeight = cellWidth
        return CGSize.init(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpace
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpace
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.init(width: collectionView.bounds.width, height: collectionView.bounds.height / 2)
    }
        
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                                withReuseIdentifier: "HomeHeader",
                                                                                for: indexPath) as! HomeHeader
                 /* Configure your section header here */
                 return headerView
        default:       preconditionFailure("Invalid supplementary view type for this collection view")

        }
    }
    

}

