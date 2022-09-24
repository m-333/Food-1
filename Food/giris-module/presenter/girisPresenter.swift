//
//  girisPresenter.swift
//  Food
//
//  Created by melek türüdi on 22.09.2022.
//

import Foundation

class LoginPagePresenter: ViewToPresenterLoginPageProtocol {
    var loginPageInteractor: PresenterToInteractorLoginPageProtocol?
    
    func loginAll(email: String, password: String) {
        loginPageInteractor?.login(email: email, password: password)
    }
}
