//
//  DetayRouter.swift
//  Food
//
//  Created by melek türüdi on 21.09.2022.
//

import Foundation
class FoodDetailRouter : PresenterToRouterFoodDetailProtocol {
    static func createModule(ref: DetayVC) {
        ref.foodDetailPresenterObject = FoodDetailPresenter()
        ref.foodDetailPresenterObject?.foodDetailInteractor = FoodDetailInteractor()
    }
}

