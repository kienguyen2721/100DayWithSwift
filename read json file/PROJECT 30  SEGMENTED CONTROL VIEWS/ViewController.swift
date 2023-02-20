//
//  ViewController.swift
//  PROJECT 30  SEGMENTED CONTROL VIEWS
//
//  Created by Nguyễn Trung Kiên on 28/11/2022.
//

import UIKit

class User: NSObject {
    var userId: Int = 0
    var id: Int = 0
    var title: String = ""
    var completed: Bool = false
}

typealias KeyValue = [String: AnyObject]


class ViewController: UIViewController {
    
    var arrayUser: [User] = [] {
        didSet {
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //        var user = User()
        //
        //        if  let myDic:[String : Any] = loadJson(filename: "1") {
        //            print(myDic)
        //
        //
        //
        //            if let title: String = myDic["title"] as? String {
        //                user.title = title
        //            }
        //
        //            if let userId: Int = myDic["userId"] as? Int {
        //                user.id = userId
        //            }
        //
        //
        //            if let id: Int = myDic["id"] as? Int {
        //                user.userId = id
        //            }
        //
        //            if let completed: Bool = myDic["completed"] as? Bool {
        //                user.completed = completed
        //            }
        //
        //
        //            print(user.id)
        //            print(user.userId)
        //            print(user.title)
        //            print(user.completed)
        //
        //
        //        }
        
        
        if let arr = loadJsonArray(filename: "posts") {
            for i in arr {
                
                let user = User.init()
                if let title: String = i["title"] as? String {
                    user.title = title
                }
                
                if let userId: Int = i["userId"] as? Int {
                    user.id = userId
                }
                
                
                if let id: Int = i["id"] as? Int {
                    user.userId = id
                }
                
                if let completed: Bool = i["completed"] as? Bool {
                    user.completed = completed
                }
                
                arrayUser.append(user)
                
                
            }
        }
        
        
        print("User 1: \(arrayUser.first?.title ?? "")")
        
    }
    
    // Tra ve 1 object
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
    
    
    
    // Tra ve mang object
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

