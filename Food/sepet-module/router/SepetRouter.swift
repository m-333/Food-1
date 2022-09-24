//
//  SepetRouter.swift
//  Food
//
//  Created by melek türüdi on 21.09.2022.
//

import Foundation
class CartRouter : PresenterToRouterCartProtocol {
    static func createModule(ref: SepetVC) {
        let presenter = CartPresenter()
        ref.cartPresenterObject = presenter
        ref.cartPresenterObject?.cartInteractor = CartInteractor()
        ref.cartPresenterObject?.cartView = ref
        ref.cartPresenterObject?.cartInteractor?.cartPresenter = presenter
    }
}

