//
//  girisRouter.swift
//  Food
//
//  Created by melek türüdi on 22.09.2022.
//

import Foundation
class LoginPageRouter : PresenterToRouterLoginPage {
    static func createModule(ref: GirisVC) {
        ref.LoginPagePresenterObject = LoginPagePresenter()
        ref.LoginPagePresenterObject?.loginPageInteractor = LoginPageInteractor()
    }
}
