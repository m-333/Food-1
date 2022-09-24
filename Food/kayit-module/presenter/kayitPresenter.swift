//
//  kayitPresenter.swift
//  Food
//
//  Created by melek türüdi on 22.09.2022.
//

import Foundation
class RegisterPresenter : ViewToPresenterRegisterProtocol {
    var registerInteractor: PresenterToInteractorRegisterProtocol?
    func registerAll(email: String, password: String) {
        registerInteractor?.register(email: email, password: password)
    }
}
