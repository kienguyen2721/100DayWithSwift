//
//  ViewController.swift
//  Project30 Main
//
//  Created by Nguyễn Trung Kiên on 05/12/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func switchContain(_sender: UISegmentedControl){
        switch _sender.selectedSegmentIndex {
            case 0:
                firstView.isHidden = true
                secondView.isHidden = false
            case 1:
                firstView.isHidden = false
                secondView.isHidden = true
            default:
                break;
            }
    }


}

