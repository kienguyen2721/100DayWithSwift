//
//  ViewControllerB.swift
//  TongHop2
//
//  Created by Nguyễn Trung Kiên on 25/10/2022.
//

import UIKit
protocol viewBDelegate {
    func sendText(text: String)
}

class ViewControllerB: UIViewController {

    @IBOutlet weak var textView: UITextView!
    var delegate: viewBDelegate?
    var tmp: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
      
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donePush))
        
    }
    @objc func donePush() {
        tmp = textView.text!
        
        delegate?.sendText(text: tmp)
        
        self.navigationController?.popViewController(animated: true)
        
    }
    

   

}
