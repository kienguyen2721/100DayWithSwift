//
//  ViewController.swift
//  ScrollView
//
//  Created by Nguyễn Trung Kiên on 14/11/2022.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {

    
    @IBOutlet weak var collectionView: UICollectionView!
    var animal: [DogAndCat] = [DogAndCat(nameOfPet: "Husky", image: "husky", noteOfPet: "Chó Husky Sibir (còn gọi là Husky Siberia) là một giống chó cỡ trung thuộc nòi chó kéo xe có nguồn gốc từ vùng Đông Bắc Sibir, Nga. Xét theo đặc điểm di truyền, chó Husky được xếp vào dòng Spitz. Chó Husky có hai lớp lông dày, tai dựng hình tam giác và thường có những điểm nhận dạng khác nhau trên lông.Chó Husky là giống chó rất ưa thích vận động do tổ tiên của chúng sống ở một trong những nơi lạnh giá nhất là Siberia, ở đây chó Husky nguyên thủy được phối giống bởi người Chukchi ở Đông Bắc Á nhằm mục đích kéo xe hàng trên một quãng đường dài trong điều kiện lạnh giá khắc nghiệt. Giống chó này được đưa tới Alaska trong thời kì khai thác vàng ở Nome rồi sau đó trở nên phổ biến ở Hoa Kỳ và Canada. Ban đầu Husky được nuôi để làm chó kéo xe nhưng về sau chúng trở thành thú nuôi làm cảnh trong gia đình.", hashtagOfPet: "#husky ", numberLikeOfPet: "♥955 likes "),
                               DogAndCat(nameOfPet: "mèo Ba Tư", image: "meoBaTu", noteOfPet: "", hashtagOfPet: "", numberLikeOfPet: ""),
                               DogAndCat(nameOfPet: "", image: "alaska", noteOfPet: "alaska", hashtagOfPet: "", numberLikeOfPet: ""),
                               DogAndCat(nameOfPet: "", image: "meoAiCap", noteOfPet: "meoAiCap", hashtagOfPet: "", numberLikeOfPet: ""),
                               DogAndCat(nameOfPet: "", image: "meoAnhLongDai", noteOfPet: "meoAnhLongDai", hashtagOfPet: "", numberLikeOfPet: ""),
                               DogAndCat(nameOfPet: "", image: "meoChanNgan", noteOfPet: "meoChanNgan", hashtagOfPet: "", numberLikeOfPet: ""),
                               DogAndCat(nameOfPet: "", image: "meoMun", noteOfPet: "meoMun", hashtagOfPet: "", numberLikeOfPet: ""),
                               DogAndCat(nameOfPet: "", image: "meoMunchkin", noteOfPet: "meoMunchKin", hashtagOfPet: "", numberLikeOfPet: ""),
                               DogAndCat(nameOfPet: "", image: "meoMuop", noteOfPet: "meoMuop", hashtagOfPet: "", numberLikeOfPet: ""),
                               DogAndCat(nameOfPet: "", image: "meoRagDoll", noteOfPet: "meoRagDoll", hashtagOfPet: "", numberLikeOfPet: ""),
                               DogAndCat(nameOfPet: "", image: "meoVang", noteOfPet: "meoVang", hashtagOfPet: "", numberLikeOfPet: ""),
                               DogAndCat(nameOfPet: "", image: "meoXiem", noteOfPet: "meoXiem", hashtagOfPet: "", numberLikeOfPet: ""),
                               
                    
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let xib = UINib.init(nibName: "Cell", bundle: nibBundle)
        collectionView.register(xib, forCellWithReuseIdentifier: "Cell")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
}
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return animal.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Cell
        cell.myImageView.image = UIImage(named: animal[indexPath.row].image)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewControllerB") as! ViewControllerB
        vc.ichi = animal[indexPath.row]
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
// layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.frame.width / 2
        let cellHeight = cellWidth
        
        let cellSize = CGSize(width: cellWidth, height: cellHeight)
        return cellSize
        
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
   
    
    
    


}

