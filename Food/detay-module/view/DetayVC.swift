//
//  DetayVC.swift
//  Food
//
//  Created by melek türüdi on 21.09.2022.
//

import UIKit
import Kingfisher
import Firebase
class DetayVC: UIViewController {
    
    @IBOutlet weak var labelAd: UILabel!
    var fav = 0
    @IBOutlet var favLabel: UILabel!
    @IBOutlet var favBtn2: UIButton!
    @IBOutlet var favBtn: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var labelFiyat: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var yemek:Yemekler?
    var foodDetailPresenterObject : ViewToPresenterFoodDetailProtocol?
    var count : Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favBtn.isHidden = true
        favBtn2.isHidden = false
        
        FoodDetailRouter.createModule(ref: self)
        
        if let f = yemek{
            labelAd.text = f.yemek_adi
            labelFiyat.text = "₺\(f.yemek_fiyat!).00"
            if let url = URL(string : "http://kasimadalan.pe.hu/yemekler/resimler/\(f.yemek_resim_adi!)") {
                    DispatchQueue.main.async {
                        self.imageView.kf.setImage(with : url)
                    }
                }
            }
      
    }
    func addFoodToCart(){
        if count >= 1 && count < 20{
            count += 1
            }
        countLabel.text = "\(count)"
        if let y = yemek
            {
                let totalFoodPrice = Int(y.yemek_fiyat!)
            labelFiyat.text = "\(totalFoodPrice! * count).00 ₺"
            }
    }
    func takeFoodOutFromCart(){
        if count > 1 && count <= 20 {
            count -= 1
        }
        countLabel.text = "\(count)"
            if let y = yemek {
                let totalFoodPrice = Int(y.yemek_fiyat!)
                labelFiyat.text = "\(totalFoodPrice! * count).00 ₺"
            }
        }
    @IBAction func minusButton(_ sender: Any) {
        takeFoodOutFromCart()
    }
    @IBAction func plusButton(_ sender: Any) {
        addFoodToCart()
    }

    @IBAction func siparisButton(_ sender: Any) {
        if let f = yemek{
            foodDetailPresenterObject?.addAllFoodToCart(yemek_adi: f.yemek_adi!, yemek_fiyat: f.yemek_fiyat!, yemek_resim_adi: f.yemek_resim_adi!, yemek_siparis_adet: String(count), kullanici_adi:  "melek")

            //alert
            let alert = UIAlertController(title: "Sepete EKle", message: "\(f.yemek_adi!) Sepete Eklendi", preferredStyle: .alert)
                        let OKAction = UIAlertAction(title: "Tamam", style: .default){ action in
                            self.navigationController?.popToRootViewController(animated: true)
                        }
                        alert.addAction(OKAction)
                        self.present(alert, animated: true)
        }
       
    }
    @IBAction func favBtn(_ sender: Any) {
        fav -= 1
        favLabel.text = "\(fav)"
        favBtn.isHidden = true
        favBtn2.isHidden = false

}
    @IBAction func favBtn2(_ sender: Any) {
        fav += 1
        favLabel.text = "\(fav)"
        favBtn.isHidden = false
        favBtn2.isHidden = true
    }
}
