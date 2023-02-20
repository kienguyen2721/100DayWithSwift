//
//  ViewControllerB.swift
//  PROJECT 26  ACTION SHEET
//
//  Created by Nguyễn Trung Kiên on 21/11/2022.
//

import UIKit

class ViewControllerB: UIViewController {

    
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var likeLabel: UILabel!
    
    @IBOutlet weak var contentLabel: UILabel!
    
    var dongVat = DogAndCat(name: "", like: "", image: "")
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        likeLabel.text = dongVat.like
        contentLabel.text = dongVat.name
        myImageView.image = UIImage(named: dongVat.image)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "edit", style: .plain, target: self, action: #selector(editProject))
                                                        
    }
                                                            
    @objc func editProject() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let reportAction = UIAlertAction(title: "Report", style: .destructive, handler: nil)
        let shareAction = UIAlertAction(title: "Share", style: .default, handler: nil)
        let saveImage = UIAlertAction(title: "Save Image", style: .default, handler: nil)
        let copyLink = UIAlertAction(title: "Copy Link ", style: .default, handler: nil)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
         
        alertController.addAction(reportAction)
        alertController.addAction(shareAction)
        alertController.addAction(saveImage)
        alertController.addAction(copyLink)
        alertController.addAction(cancel)
        
        present(alertController, animated: true, completion: nil)
        }
                                                            
                                                            
    

    

}
