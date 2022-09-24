//
//  AnasayfaPresenter.swift
//  Food
//
//  Created by melek türüdi on 17.09.2022.
//

import Foundation
class AnasayfaPresenter : ViewToPresenterAnasayfaProtocol {
    
    var anasayfaInteractor: PresenterToInteractorAnasayfaProtocol?
    var anasayfaView: PresenterToViewAnasayfaProtocol?
    
    func yemekleriYukle() {
        anasayfaInteractor?.yemekleriAl()
    }
    
    func ara(aramaKelimesi: String) {
        anasayfaInteractor?.yemekAra(aramaKelimesi: aramaKelimesi)
    }
    
    
}

extension AnasayfaPresenter : InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(yemekListesi: Array<Yemekler>) {
        anasayfaView?.vieweVeriGonder(yemekListesi: yemekListesi)
    }
}

