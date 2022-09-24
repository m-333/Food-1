//
//  SepetVC.swift
//  Food
//
//  Created by melek türüdi on 21.09.2022.
//

import UIKit
import Alamofire
import Kingfisher

class SepetVC: UIViewController {

    @IBOutlet weak var sepetTableview: UITableView!
    @IBOutlet weak var toplamLabel: UILabel!
    
    var cartPresenterObject : ViewToPresenterCartProtocol?
    var sepetYemek = [SepetYemekler]()
    var foodsCount = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        sepetTableview.delegate = self
        sepetTableview.dataSource = self
        
        CartRouter.createModule(ref: self)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        cartPresenterObject?.getAllCart()
        cartPresenterObject?.getCount()
    }
    @IBAction func placeOrderButton(_ sender: Any) {
        performSegue(withIdentifier: "finalVC", sender: nil)
    }
    @IBAction func siparisBtn(_ sender: Any) {
        
        performSegue(withIdentifier: "siparis", sender: nil)
        self.cartPresenterObject?.deleteAlltems(carts: sepetYemek)
        self.sepetTableview.reloadData()
        self.sepetTableview.dataSource = nil
        self.toplamLabel.text = "0"
        
    }

}
extension SepetVC : PresenterToViewCartProtocol {
    func sendDataToView(cartList: Array<SepetYemekler>) {
        self.sepetYemek = cartList
        DispatchQueue.main.async {
            self.sepetTableview.reloadData()
            var total = 0
            self.sepetYemek.forEach { cart_food in
                total = total + (Int(cart_food.yemek_fiyat ?? "0")! * Int(cart_food.yemek_siparis_adet ?? "0")!)
            }
            self.toplamLabel.text = "\(total).00 ₺"
        }
    }
    func sendDataToView(foodCount: Int) {
        self.foodsCount = foodCount
        DispatchQueue.main.async {
            self.sepetTableview.reloadData()
        }
    }
}
extension SepetVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sepetYemek.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sepetyemek = sepetYemek[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "sepetHucre", for: indexPath) as! SepetTableViewCell
        cell.yemekAd.text = sepetyemek.yemek_adi!
        cell.fiyatLabel.text = "\(Int(sepetyemek.yemek_fiyat!)!).00 ₺"
        cell.foodCount.text = "\(sepetyemek.yemek_siparis_adet!) adet"
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(sepetyemek.yemek_resim_adi!)") {
            DispatchQueue.main.async {
                cell.resimImageView.kf.setImage(with: url)
            }
        }
        return cell
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (contextualAction,view,bool) in
                let cart = self.sepetYemek[indexPath.row]
                self.sepetYemek.remove(at: indexPath.row)
                self.cartPresenterObject?.deleteSingleItem(cart: cart, kullanici_adi: "melek")
                tableView.reloadData()
                  self.foodsCount -= 1
                    if self.foodsCount == 0 {
                        self.toplamLabel.text = "0"
                   }
                    print(self.foodsCount)
                }
                return UISwipeActionsConfiguration(actions: [deleteAction])
            }
}
