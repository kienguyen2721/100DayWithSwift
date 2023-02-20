//
//  ViewController.swift
//  Project31
//
//  Created by Nguyễn Trung Kiên on 06/12/2022.
//

import UIKit

class Vegetable: NSObject {
    var name: String = ""
    var photo_url: String = ""
    var quantity: String = ""
    var id: Int = 0
    var price: Int = 0
}
typealias KeyValue = [String: AnyObject]

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,
    UISearchResultsUpdating,UISearchBarDelegate
{

    @IBOutlet weak var collectionView: UICollectionView!
    var arrayVegetable: [Vegetable] = []{
        didSet{}
    }
    var searching = false
    var searchingVegetable = [Vegetable]()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        readJsonFile()
        makeSearchBar()
        let xib = UINib.init(nibName: "VegetableCell", bundle: nil)
        collectionView.register(xib, forCellWithReuseIdentifier: "VegetableCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        
       
        
        
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searching {
            return searchingVegetable.count
        }else{
            return arrayVegetable.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = arrayVegetable[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VegetableCell", for: indexPath) as! VegetableCell
        
        if searching {
            cell.txtLabel.text = searchingVegetable[indexPath.row].name
            cell.icoImageView.downloaded(from: searchingVegetable[indexPath.row].photo_url)
        }else{
            cell.txtLabel.text = index.name
            cell.icoImageView.downloaded(from: index.photo_url)
        }
        
      
        return cell
        
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (collectionView.frame.width - 10) / 2
        let cellHeight = cellWidth
        return CGSize(width: cellWidth, height: cellHeight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    // read json file
    func readJsonFile() {
        if let arr = loadJsonArray(filename: "gistfile1") {
            for i in arr {
                
                let tmp = Vegetable.init()
                if let name: String = i["name"] as? String {
                    tmp.name = name
                }
                
                if let photo_url: String = i["photo_url"] as? String{
                    tmp.photo_url = photo_url
                }
                
                if let quantity: String = i["quantity"] as? String {
                    tmp.quantity = quantity
                }
                
                if let id: Int = i["id"] as? Int {
                    tmp.id = id
                }
                
                
                if let price: Int = i["price"] as? Int {
                    tmp.price = price
                }
                arrayVegetable.append(tmp)
                
                
            }
        }
    }
    func loadJsonArray(filename fileName: String) -> [KeyValue]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let object = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                if let dictionary = object as? [KeyValue] {
                    return dictionary
                }
            } catch {
                print("Error!! Unable to parse  \(fileName).json")
            }
        }
        return nil
    }
    //search
    func makeSearchBar() {
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.search
        self .navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.searchController = searchController
        definesPresentationContext = true
        searchController.searchBar.placeholder = "Search Vegetable By Name"
        
    }
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text!
        if !searchText.isEmpty {
            searching = true
            searchingVegetable.removeAll()
            for vege in arrayVegetable {
                if vege.name.lowercased().contains(searchText.lowercased()) {
                    searchingVegetable.append(vege)
                }
            }
            
        }else{
            searching = false
            searchingVegetable.removeAll()
            searchingVegetable = arrayVegetable
            
        }
        collectionView.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchingVegetable.removeAll()
        collectionView.reloadData()
        
    }


}
//url
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFill) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFill) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

