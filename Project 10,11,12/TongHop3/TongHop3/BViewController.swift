//
//  BViewController.swift
//  TongHop3
//
//  Created by Nguyễn Trung Kiên on 28/10/2022.
//

import UIKit
protocol viewBDelegate {
    func sendText(text: String)
}

class BViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    var delegate: viewBDelegate? = nil
    var car: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donePress))
        
    }
    @objc func donePress() {
        car = textField.text!
        
        delegate?.sendText(text: car)
        self.navigationController?.popViewController(animated: true)
        
        
        
    }
    

    

}
