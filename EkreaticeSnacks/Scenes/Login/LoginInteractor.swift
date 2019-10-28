//
//  LoginInteractor.swift
//  EkreaticeSnacks
//
//  Created by Oleksand Atamanskyi on 10/28/19.
//  Copyright © 2019 Oleksand Atamanskyi. All rights reserved.
//

import Foundation

final class LoginInteractor {
    var loginRouter: LoginRouter
    
    init(loginRouter: LoginRouter) {
        self.loginRouter = loginRouter
    }
}
