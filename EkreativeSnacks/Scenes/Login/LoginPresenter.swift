//
//  LoginPresenter.swift
//  EkreativeSnacks
//
//  Created by Oleksand Atamanskyi on 10/28/19.
//  Copyright © 2019 Oleksand Atamanskyi. All rights reserved.
//

import Foundation

protocol LoginPresenterOutput {
    func showSnacks()
}

final class LoginPresenter {
    private let loginInteractor: LoginInteractor
    private let loginRouter: LoginRouter
    
    init(loginInteractor: LoginInteractor, loginRouter: LoginRouter) {
        self.loginInteractor = loginInteractor
        self.loginRouter = loginRouter
    }
}

extension LoginPresenter: LoginPresenterOutput {
    func showSnacks() {
        loginRouter.showSnacks()
    }
}
