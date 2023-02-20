//
//  ViewController.swift
//  read Joson file
//
//  Created by Nguyễn Trung Kiên on 02/12/2022.
//

import UIKit
class fileJson: NSObject {
    var userId: Int = 0
    var id: Int = 0
    var title: String = ""
    var body: String = ""
}
typealias KeyValue = [String: AnyObject]
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var arrayUser: [fileJson] = [] {
        didSet {
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        readJson()
     
        let xib = UINib.init(nibName: "MainCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "MainCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        

       
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayUser.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as! MainCell
        cell.txtLabel.text = "\(arrayUser[indexPath.row].id)"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewControllerB") as! ViewControllerB
        
        vc.text3 = "UserId: \(arrayUser[indexPath.row].userId)"
        vc.text2 = arrayUser[indexPath.row].title
        vc.text1 = "Id: \(arrayUser[indexPath.row].id)"
        vc.text4 = arrayUser[indexPath.row].body
        
        
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    func readJson() {
        if let arr = loadJsonArray(filename:"posts") {
            for i in arr {
                
                let user = fileJson.init()
                if let title: String = i["title"] as? String {
                    user.title = title
                }
                
                if let userId: Int = i["userId"] as? Int {
                    user.userId = userId
                }
                
                if let id: Int = i["id"] as? Int {
                    user.id = id
                }
                
                if let body: String = i["body"] as? String {
                    user.body = body
                }

                arrayUser.append(user)
                
            }
            for index in arrayUser{
                print(index.id)
            }
            
        }
    }
    func loadJson(filename fileName: String) -> KeyValue? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let object = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                if let dictionary = object as? KeyValue {
                    return dictionary
                }
            } catch {
                print("Error!! Unable to parse  \(fileName).json")
            }
        }
        return nil
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


}

