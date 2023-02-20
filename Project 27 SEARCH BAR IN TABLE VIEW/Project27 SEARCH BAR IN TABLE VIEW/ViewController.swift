//
//  ViewController.swift
//  Project27 SEARCH BAR IN TABLE VIEW
//
//  Created by Nguyễn Trung Kiên on 21/11/2022.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var animal: [String] = ["cat","dog","Snake","tiger","mice","chicken"]
    var filter: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let xib = UINib.init(nibName: "Cell", bundle: nibBundle)
        tableView.register(xib, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        tableView.delegate = self
        
        searchBar.delegate = self
        filter = animal
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filter.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
        
        cell.cellLabel.text = filter[indexPath.row]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filter = []
        if searchText == "" {
            filter = animal
        }else {
            for type in animal {
                if type.lowercased().contains(searchText.lowercased()) {
                    filter.append(type)
                }
            }
        }
        self.tableView.reloadData()
        
    }


}

