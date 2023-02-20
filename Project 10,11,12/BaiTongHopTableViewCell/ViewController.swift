//
//  ViewController.swift
//  BaiTongHopTableViewCell
//
//  Created by Nguyễn Trung Kiên on 25/10/2022.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    var character: [String] = ["Naruto","Sasuke","Sakura","Kakashi","Itachi"]
    
    let refreshController = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()
    
       
        
        let xib = UINib.init(nibName: "MyCell", bundle: nibBundle)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(xib, forCellReuseIdentifier: "MyCell")
        
        refreshController.attributedTitle = NSAttributedString.init(string: "Pull to reset")
        refreshController.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshController)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTitle))
    }
//addTitile chuyen trang
    
    @objc func addTitle() {
        let viewConB = self.storyboard?.instantiateViewController(withIdentifier: "ViewControllerB") as! ViewControllerB
        viewConB.delegate = self
        self.navigationController?.pushViewController(viewConB, animated: true)
    }
// Tao tableViewCell
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return character.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let items = character[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MyCell
        cell.cellLabel.text = items
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
//Refersh to reset
    @objc func refresh(_ sender: AnyObject) {
         character = ["Naruto","Sasuke","Sakura","Kakashi","Itachi"]
        tableView.reloadData()
        refreshController.endRefreshing()
    }
// Sort tableView
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        character.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
//Delete tableView
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            character.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
   
    
 //Push Button
    @IBAction func didTapSort(_ sender: Any) {
        if tableView.isEditing {
            tableView.isEditing = false
        }else {
            tableView.isEditing = true
        }
    }
    
}
//delegate
extension ViewController: viewBDelagate {
    func sendText(text: String) {
        self.character.append(text)
        tableView.reloadData()
    }
}

