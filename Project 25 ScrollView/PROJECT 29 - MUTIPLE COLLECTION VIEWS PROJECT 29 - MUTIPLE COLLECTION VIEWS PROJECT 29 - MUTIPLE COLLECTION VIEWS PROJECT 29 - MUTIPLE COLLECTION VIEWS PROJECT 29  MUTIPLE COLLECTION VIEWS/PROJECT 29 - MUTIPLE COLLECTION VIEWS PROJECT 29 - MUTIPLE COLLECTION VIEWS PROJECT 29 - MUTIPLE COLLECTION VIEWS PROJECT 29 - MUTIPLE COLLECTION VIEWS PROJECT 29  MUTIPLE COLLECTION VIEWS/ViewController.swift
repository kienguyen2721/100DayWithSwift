//
//  ViewController.swift
//  PROJECT 29 - MUTIPLE COLLECTION VIEWS PROJECT 29 - MUTIPLE COLLECTION VIEWS PROJECT 29 - MUTIPLE COLLECTION VIEWS PROJECT 29 - MUTIPLE COLLECTION VIEWS PROJECT 29  MUTIPLE COLLECTION VIEWS
//
//  Created by Nguyễn Trung Kiên on 28/11/2022.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    
    var note: [Note] =  [Note.init(title: "Tokyo Ghoul", image: "soon-1"),
                         Note.init(title: "Record of Ragnarok", image: "soon-2"),
                         Note.init(title: "Kaisen Returns", image: "soon-3"),
                         Note.init(title: "No Idea", image: "soon-4"),
                         Note.init(title: "Looks interesting", image: "soon-5")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let hitXib = UINib.init(nibName: "HeaderReusableView", bundle: nil)
        collectionView.register(hitXib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderReusableView")
        
        let xib = UINib.init(nibName: "CharacterViewCell", bundle: nil)
        collectionView.register(xib, forCellWithReuseIdentifier: "CharacterViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return note.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterViewCell", for: indexPath) as! CharacterViewCell
        cell.iconImageView.image = UIImage(named: note[indexPath.row].image)
        cell.tittleLabel.text = note[indexPath.row].title
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.frame.width / 3
        let cellheight = cellWidth
        return CGSize(width: cellWidth, height: cellheight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.init(width: collectionView.bounds.width, height: 230)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind:kind,withReuseIdentifier: "HeaderReusableView",for: indexPath) as! HeaderReusableView
                 
                 return headerView
        default:       preconditionFailure("Invalid supplementary view type for this collection view")

        }
    }
}

