//
//  ViewControllerB.swift
//  BaiTongHopTableViewCell
//
//  Created by Nguyễn Trung Kiên on 25/10/2022.
//

import UIKit
protocol viewBDelagate {
    func sendText(text: String)
}

class ViewControllerB: UIViewController {

    
    @IBOutlet weak var textView: UITextView!
    
    var tmp: String = ""
    
    var delegate: viewBDelagate?
      
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(didTapDone))
    }
    @objc func didTapDone() {
        tmp = textView.text!
        
        delegate?.sendText(text: tmp)
        
        self.navigationController?.popViewController(animated: true)
    }

 
}
