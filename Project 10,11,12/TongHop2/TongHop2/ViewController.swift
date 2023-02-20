//
//  ViewController.swift
//  TongHop2
//
//  Created by Nguyễn Trung Kiên on 27/10/2022.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var character: [String] = ["hazuki","Nyatame"]
    
    let refreshController =  UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTextView))
        
        let xib = UINib.init(nibName: "MyCell", bundle: nibBundle)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(xib, forCellReuseIdentifier: "MyCell")
        
        refreshController.attributedTitle = NSAttributedString(string: "Pull to reset")
        refreshController.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshController)
        
        
    }

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
    @objc func refresh(_ sender: AnyObject) {
        character = ["hazuki","Nyatame"]
        tableView.reloadData()
        refreshController.endRefreshing()
    }
    // sort tableView
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        character.swapAt(destinationIndexPath.row, sourceIndexPath.row)
    }
    //delete tableView
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
    @objc func addTextView() {
        let vConB = self.storyboard?.instantiateViewController(withIdentifier: "ViewControllerB") as! ViewControllerB
        vConB.delegate = self
        self.navigationController?.pushViewController(vConB, animated: true)
        
    }
    
    

}
extension ViewController: viewBDelegate {
    func sendText(text: String) {
        self.character.append(text)
        tableView.reloadData()
    }
}

