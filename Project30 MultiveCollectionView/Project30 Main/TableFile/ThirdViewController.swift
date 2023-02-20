//
//  ThirdViewController.swift
//  Project30 Main
//
//  Created by Nguyễn Trung Kiên on 05/12/2022.
//

import UIKit

class ThirdViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var pet: [InfoMation] = [InfoMation.init(name: "A", image: "alaska"),
                             InfoMation.init(name: "A", image: "husky"),
                             InfoMation.init(name: "A", image: "husky1"),
                             InfoMation.init(name: "A", image: "meoAiCap"),
                             InfoMation.init(name: "A", image: "meoAnhLongDai"),
                             InfoMation.init(name: "A", image: "meoBaTu"),
                             InfoMation.init(name: "A", image: "meoChanNgan"),
                             InfoMation.init(name: "A", image: "meoMun"),
                             InfoMation.init(name: "A", image: "meoMuop"),
                             InfoMation.init(name: "A", image: "meoVang"),
                             InfoMation.init(name: "A", image: "meoXiem"),
                             InfoMation.init(name: "A", image: "meoRagDoll")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
        let xib = UINib.init(nibName: "TableViewCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "TableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pet.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.txtLabel.text = pet[indexPath.row].name
        cell.iconImageView.image = UIImage(named: pet[indexPath.row].image)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
        
    }
    
    



}
