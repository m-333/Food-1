//
//  SepetInteractor.swift
//  Food
//
//  Created by melek türüdi on 21.09.2022.
//

import Foundation
import Alamofire
import Firebase

class CartInteractor : PresenterToInteractorCartProtocol {
    var cartPresenter: InteractorToPresenterCartProtocol?
    func getCart() {
        let param : Parameters = ["kullanici_adi" : "melek"]
                AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php", method: .post, parameters: param).response { response in
                    if let data = response.data {
                        do {
                            let cevap = try JSONDecoder().decode(SepetYemekCevap.self, from: data)
                            var list = [SepetYemekler]()
                            if let answerList = cevap.sepet_yemekler {
                                list = answerList
                            }
                            self.cartPresenter?.sendDataToPresenter(cartList: list)
                        } catch  {
                            print(error.localizedDescription)
                        }
                    }
                }
            }
    func deleteSingle(cart: SepetYemekler, kullanici_adi: String) {
        let param : Parameters = [
            "sepet_yemek_id" : cart.sepet_yemek_id!,
            "kullanici_adi" : "melek"]
                AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php", method: .post, parameters: param).response{ response in
                    if let data = response.data {
                        do{
                            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                                print(json)
                                self.getCart()
                                }
                        }catch {
                            print(error.localizedDescription)
                        }
                    }
                }
            }
    func deleteAlltems(carts: Array<SepetYemekler>) {
        for cartItem in carts{
                   DispatchQueue.main.async { [weak self] in
                       self?.deleteSingle(cart: cartItem, kullanici_adi: "melek")
                   }
               }
           }
    func getCount() {
        let param : Parameters = ["kullanici_adi" : "melek"]
                AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php", method: .post, parameters: param).response{ response in
                    if let data = response.data {
                        do {
                            let cevap = try JSONDecoder().decode(SepetYemekCevap.self, from: data)
                            var list = [SepetYemekler]()
                            if let cevapList = cevap.sepet_yemekler {
                                list = cevapList
                            }
                            print(list)
                            self.cartPresenter?.sendDataToPresenter(foodCount: list.count)
                        } catch  {
                            print(error.localizedDescription)
                        }
                    }
                }
    }
}
