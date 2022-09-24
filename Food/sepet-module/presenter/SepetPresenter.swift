//
//  SepetPresenter.swift
//  Food
//
//  Created by melek türüdi on 21.09.2022.
//

import Foundation
class CartPresenter : ViewToPresenterCartProtocol {
    var cartInteractor: PresenterToInteractorCartProtocol?
    var cartView: PresenterToViewCartProtocol?
    
    func getAllCart() {
        cartInteractor?.getCart()
    }
    func deleteSingleItem(cart: SepetYemekler, kullanici_adi: String) {
        cartInteractor?.deleteSingle(cart: cart, kullanici_adi: kullanici_adi)
    }
    func deleteAlltems(carts: Array<SepetYemekler>) {
        cartInteractor?.deleteAlltems(carts: carts)
    }
    func getCount() {
        cartInteractor?.getCount()
    }
}
extension CartPresenter : InteractorToPresenterCartProtocol {
    func sendDataToPresenter(foodCount: Int) {
        cartView?.sendDataToView(foodCount: foodCount)
    }
    func sendDataToPresenter(cartList: Array<SepetYemekler>) {
        cartView?.sendDataToView(cartList: cartList)
    }
}
