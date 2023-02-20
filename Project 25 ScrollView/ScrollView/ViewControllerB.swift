//
//  ViewControllerB.swift
//  ScrollView
//
//  Created by Nguyễn Trung Kiên on 18/11/2022.
//

import UIKit

class ViewControllerB: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    
    
    @IBOutlet weak var numberLikeOfLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    @IBOutlet weak var hashtagOfLabel: UILabel!
    
    var ichi = DogAndCat.init(nameOfPet: "", image: "", noteOfPet: "", hashtagOfPet: "", numberLikeOfPet: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myImageView.image = UIImage(named: ichi.image)
        numberLikeOfLabel.text = ichi.numberLikeOfPet
        contentLabel.text = ichi.noteOfPet
        hashtagOfLabel.text = ichi.hashtagOfPet
        
        // Do any additional setup after loading the view.
    }
    

    

}
