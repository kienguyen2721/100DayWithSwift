//
//  ViewControllerB.swift
//  read Joson file
//
//  Created by Nguyễn Trung Kiên on 05/12/2022.
//

import UIKit

class ViewControllerB: UIViewController {

    @IBOutlet weak var txt1: UILabel!
    @IBOutlet weak var txt2: UILabel!
    @IBOutlet weak var txt3: UILabel!
    @IBOutlet weak var txt4: UILabel!
    
    var text2: String = ""
    var text1: String = ""
    var text3: String = ""
    var text4: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txt1.text = text1
        txt2.text = text2
        txt3.text = text3
        txt4.text = text4

        // Do any additional setup after loading the view.
    }
    

  

}
