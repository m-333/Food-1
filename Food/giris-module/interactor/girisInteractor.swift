//
//  girisInteractor.swift
//  Food
//
//  Created by melek türüdi on 22.09.2022.
//

import Foundation
import Firebase

class LoginPageInteractor : PresenterToInteractorLoginPageProtocol {
    func login(email: String, password: String) {
        let auth = Auth.auth()
        auth.signIn(withEmail: email, password: password) { authResult, error in }
            }
        }
