//
//  ViewController.swift
//  PROJECT 26  ACTION SHEET
//
//  Created by Nguyễn Trung Kiên on 21/11/2022.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var animal: [DogAndCat] = [DogAndCat(name: "Husky", like: "♥955 likes", image: "husky1"),
                               DogAndCat(name: "Husky", like: "♥955 likes", image: "husky1"),
                               DogAndCat(name: "Husky", like: "♥955 likes", image: "husky1"),
                               DogAndCat(name: "Husky", like: "♥955 likes", image: "husky1"),
                               DogAndCat(name: "Husky", like: "♥955 likes", image: "husky1"),
                               DogAndCat(name: "Chó Husky Sibir (còn gọi là Husky Siberia)   là một giống chó cỡ trung thuộc nòi chó kéo xe có nguồn gốc từ vùng Đông Bắc Sibir, Nga. Xét theo đặc điểm di truyền, chó Husky được xếp vào dòng Spitz. Chó Husky có hai lớp lông dày, tai dựng hình tam giác và thường có những điểm nhận dạng khác nhau trên lông.Chó Husky là giống chó rất ưa thích vận động do tổ tiên của chúng sống ở một trong những nơi lạnh giá nhất là Siberia, ở đây chó Husky nguyên thủy được phối giống bởi người Chukchi ở Đông Bắc Á nhằm mục đích kéo xe hàng trên một quãng đường dài trong điều kiện lạnh giá khắc nghiệt. Giống chó này được đưa tới Alaska trong thời kì khai thác vàng ở Nome rồi sau đó trở nên phổ biến ở Hoa Kỳ và Canada. Ban đầu Husky được nuôi để làm chó kéo xe nhưng về sau chúng trở thành thú nuôi làm cảnh trong gia đình.Lịch sử về chó Husky SibirCác giống chó Husky Sibir, Samoyed, và Alaskan Malamute đã được công nhận đều có chung nguồn gốc từ một giống chó cổ đại theo kết quả DNA công bố năm 2004.Từ năm 1908, chúng được du nhập vào Alaska trong thời kỳ khai thác vàng và được sử dụng là chó kéo xe và chó đua xe. Ở đây, xe kéo bởi vì chó Husky nhanh chóng trở thành phương tiện phổ biến lúc bây giờ. Năm 1930, việc xuất khẩu chó ở Siberia bị dừng lại, cũng là năm mà câu lạc bộ chó giống Mỹ (AKC) công nhận giống chó Husky Sibir. Chín năm sau, giống chó này lần đầu tiên được đăng kiểm ở Canada. Năm 1938 United Kennel Club công nhận giống chó và đổi tên thành Husky Sibir vào năm 1991 cho tới nay.Giống chó Husky nguyên thủy được nuôi và phối giống bởi người Chukchi được cho là đã tuyệt chủng nhưng một phóng viên của tạp chí vào năm 2006 đã đưa ra báo cáo chúng còn sống sau chuyến công tác của anh tại Siberia", like: "♥955 likes", image: "husky1"),
                               DogAndCat(name: "Husky", like: "♥955 likes", image: "husky1"),
                               DogAndCat(name: "Husky", like: "♥955 likes", image: "husky1"),
                               DogAndCat(name: "Husky", like: "♥955 likes", image: "husky1"),
                               DogAndCat(name: "Husky", like: "♥955 likes", image: "husky1"),
                               DogAndCat(name: "Husky", like: "♥955 likes", image: "husky1"),
                               DogAndCat(name: "Husky", like: "♥955 likes", image: "husky1"),
                               DogAndCat(name: "Husky", like: "♥955 likes", image: "husky"),
                               DogAndCat(name: "Husky", like: "♥955 likes", image: "husky"),
                               DogAndCat(name: "Husky", like: "♥955 likes", image: "husky"),
                               DogAndCat(name: "Husky", like: "♥955 likes", image: "husky"),
                               DogAndCat(name: "Husky", like: "♥955 likes", image: "husky"),
                               DogAndCat(name: "Husky", like: "♥955 likes", image: "husky"),
                               DogAndCat(name: "Husky", like: "♥955 likes", image: "husky"),
                               DogAndCat(name: "Husky", like: "♥955 likes", image: "husky"),
                               DogAndCat(name: "Husky", like: "♥955 likes", image: "husky"),
                               DogAndCat(name: "Husky", like: "♥955 likes", image: "husky")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let xib = UINib.init(nibName: "Cell", bundle: nibBundle)
        collectionView.register(xib, forCellWithReuseIdentifier: "Cell")
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
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
        //0
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewControllerB") as! ViewControllerB
        
        vc.dongVat = animal[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.frame.width / 3
        let cellHeight = cellWidth
        
        return CGSize(width: cellWidth, height: cellHeight)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

}

