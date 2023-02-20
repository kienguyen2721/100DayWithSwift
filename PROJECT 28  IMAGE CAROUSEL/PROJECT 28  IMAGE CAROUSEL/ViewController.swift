//
//  ViewController.swift
//  PROJECT 28  IMAGE CAROUSEL
//
//  Created by Nguyễn Trung Kiên on 22/11/2022.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var myPage: UIPageControl!
    
    
    var tmp = ["dog","cat","snake","man","female","dog","cat","snake","man","female","dog","cat","snake","man","female","dog","cat","snake","man","female"]
    
    var image: [String] = ["lam","lam1","lam2","lam3","lam4"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myPage.currentPage = 0
        myPage.numberOfPages = image.count
        
        
        
        creatTableViewCell()
        creatCollectionViewCell()
    }
    func creatTableViewCell() {
        let xib1 = UINib.init(nibName: "TableCell", bundle: nibBundle)
        tableView.register(xib1, forCellReuseIdentifier: "TableCell")
        tableView.dataSource = self
        tableView.delegate = self
        
        
        
    }
    
    func creatCollectionViewCell() {
        let xib2 = UINib.init(nibName: "Cell1", bundle: nibBundle)
        collectionView.register(xib2, forCellWithReuseIdentifier: "Cell1")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    //collection view
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return image.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell1", for: indexPath) as! Cell1
        collectionCell.myImageView.image = UIImage(named: image[indexPath.row])
        return collectionCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        

        let cellWidth = collectionView.frame.width
        let cellHeight = collectionView.frame.height
        
        return CGSize(width: cellWidth, height: cellHeight)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
   
    
    
    //tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tmp.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! TableCell
        tableCell.iconImageView.text = tmp[indexPath.row]
        return tableCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
    // pagecontrol
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        myPage.currentPage = indexPath.row
    }
    
    
    
    
    
    
    
    
    
    
    
    
    


}

