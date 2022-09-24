//
//  SepetProtocol.swift
//  Food
//
//  Created by melek türüdi on 21.09.2022.
//

import Foundation
protocol ViewToPresenterCartProtocol {
    var cartInteractor : PresenterToInteractorCartProtocol? {get set}
    var cartView : PresenterToViewCartProtocol? {get set}
    
    func getAllCart()
    func deleteSingleItem(cart: SepetYemekler, kullanici_adi: String)
    
    func deleteAlltems(carts : Array<SepetYemekler>)
    func getCount()

}
protocol PresenterToInteractorCartProtocol {
    var cartPresenter : InteractorToPresenterCartProtocol? {get set}
    
    func getCart()
    func deleteSingle(cart: SepetYemekler, kullanici_adi: String)
    
    func deleteAlltems(carts : Array<SepetYemekler>)
    func getCount()
}

protocol InteractorToPresenterCartProtocol {
    func sendDataToPresenter(cartList : Array<SepetYemekler>)
    func sendDataToPresenter(foodCount : Int)
}

protocol PresenterToViewCartProtocol {
    func sendDataToView(cartList : Array<SepetYemekler>)
    func sendDataToView(foodCount : Int)
}

protocol PresenterToRouterCartProtocol{
    static func createModule(ref: SepetVC)
}

