//
//  kayitProtocol.swift
//  Food
//
//  Created by melek türüdi on 22.09.2022.
//

import Foundation
protocol ViewToPresenterRegisterProtocol {
    var registerInteractor: PresenterToInteractorRegisterProtocol? { get set }
    func registerAll(email: String, password: String)
}
protocol PresenterToInteractorRegisterProtocol {
    func register(email: String, password: String)
}
protocol PresenterToRouterRegisterProtocol {
    static func createModule(ref: KayitVC)
}
