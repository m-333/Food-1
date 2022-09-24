//
//  AnasayfaInteractor.swift
//  Food
//
//  Created by melek türüdi on 17.09.2022.
//

import Foundation
import Alamofire
import Firebase
import SwiftUI

class AnasayfaInteractor : PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    
    func yemekleriAl() {
            
        AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php",method:.get).response { response in
                    if let data = response.data {
                        do {
                            let answer = try JSONDecoder().decode(YemeklerCevap.self, from: data)
                            var list = [Yemekler]()
                            if let answerList = answer.yemekler {
                                list = answerList
                            }
                           // self.anasayfaPresenter?.presenteraVeriGonder(yemek: list)
                            self.anasayfaPresenter?.presenteraVeriGonder(yemekListesi: list)
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }
        }
    
    func yemekAra(aramaKelimesi: String) {
        print("Arama sonucu : \(aramaKelimesi)")
    }
    
}
