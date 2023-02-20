//
//  ViewController.swift
//  TongHop3
//
//  Created by Nguyễn Trung Kiên on 28/10/2022.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var carName: [String] = ["lambo","mayBach","mezedes"]
    
    let refreshController = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let xib = UINib.init(nibName: "MyCell", bundle: nibBundle)
        tableView.register(xib, forCellReuseIdentifier: "MyCell")
        tableView.dataSource = self
        tableView.delegate = self
        
        refreshController.attributedTitle = NSAttributedString(string: "pull to reset")
        refreshController.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshController)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addInfo))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sort", style: .plain, target: self, action: #selector(sortButton))
    }

    @objc func refresh(_ sender: AnyObject) {
        carName = ["lambo","mayBach","mezedes"]
        tableView.reloadData()
        refreshController.endRefreshing()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carName.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let items = carName[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MyCell
        cell.cellLabel.text = items
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    @objc func addInfo() {
        let vConB = self.storyboard?.instantiateViewController(withIdentifier: "BViewController") as! BViewController
        vConB.delegate = self
        self.navigationController?.pushViewController(vConB, animated: true)
    }
    // sort tableView
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        carName.swapAt(destinationIndexPath.row, sourceIndexPath.row)
    }
    //delete tableView
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            tableView.beginUpdates()
            carName.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    @objc func sortButton() {
        if tableView.isEditing {
            tableView.isEditing = false
        }else {
            tableView.isEditing = true
        }
    }
    

}
extension ViewController: viewBDelegate {
    func sendText(text: String) {
        
        carName.append(text)
        tableView.reloadData()
    }
    
    
}


////sort
//func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//    return true
//}
//func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//    carName.swapAt(sourceIndexPath.row, destinationIndexPath.row)
//}
////delete
//func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//    return .delete
//}
//func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//    if editingStyle == .delete {
//        tableView.beginUpdates()
//        carName.remove(at: indexPath.row)
//        tableView.deleteRows(at: [indexPath], with: .fade)
//        tableView.endUpdates()
//    }
//}


//delete

