//
//  SecondViewController.swift
//  Project30 Main
//
//  Created by Nguyễn Trung Kiên on 05/12/2022.
//

import UIKit

class SecondViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var movies: [InfoMation] = [InfoMation.init(name: "A", image: "soon-1"),
                                InfoMation.init(name: "B", image: "soon-2"),
                                InfoMation.init(name: "B", image: "soon-3"),
                                InfoMation.init(name: "B", image: "soon-4"),
                                InfoMation.init(name: "B", image: "soon-5"),
                                InfoMation.init(name: "B", image: "profile-1"),
                                InfoMation.init(name: "B", image: "profile-2"),
                                InfoMation.init(name: "B", image: "profile-3"),
                                InfoMation.init(name: "B", image: "profile-4"),
                                InfoMation.init(name: "B", image: "profile-5"),
                                InfoMation.init(name: "B", image: "profile-6"),
                                InfoMation.init(name: "B", image: "profile-7"),
                                InfoMation.init(name: "B", image: "profile-8")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let xib = UINib.init(nibName: "CollectionViewCell", bundle: nil)
      
        collectionView.register(xib, forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.iconImageView.image = UIImage(named: movies[indexPath.row].image)
        cell.txtLabel.text = movies[indexPath.row].name
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.frame.width / 2
        let cellheight = cellWidth
        return CGSize(width: cellWidth, height: cellheight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    

}
