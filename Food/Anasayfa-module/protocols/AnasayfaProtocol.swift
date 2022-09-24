//
//  AnasayfaProtocol.swift
//  Food
//
//  Created by melek türüdi on 17.09.2022.
//

import Foundation
protocol ViewToPresenterAnasayfaProtocol {
    var anasayfaInteractor:PresenterToInteractorAnasayfaProtocol? {get set}
    var anasayfaView:PresenterToViewAnasayfaProtocol? {get set}
    
    func yemekleriYukle()
    func ara(aramaKelimesi:String)
    
}

protocol PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter:InteractorToPresenterAnasayfaProtocol? {get set}
    
    func yemekleriAl()
    func yemekAra(aramaKelimesi:String)
    
}

protocol InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(yemekListesi:Array<Yemekler>)
}

protocol PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(yemekListesi:Array<Yemekler>)
}

protocol PresenterToRouterAnasayfaProtocol {
    static func createModule(ref:AnasayfaVC)
}
