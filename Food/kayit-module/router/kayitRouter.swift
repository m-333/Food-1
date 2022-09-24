//
//  kayitRouter.swift
//  Food
//
//  Created by melek türüdi on 22.09.2022.
//

import Foundation
class RegisterRouter: PresenterToRouterRegisterProtocol {
    static func createModule(ref: KayitVC) {
        ref.registerPresenterObject = RegisterPresenter()
        ref.registerPresenterObject?.registerInteractor = RegisterInteractor()
    }
}
