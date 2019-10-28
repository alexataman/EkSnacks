//
//  LoginPresenter.swift
//  EkreaticeSnacks
//
//  Created by Oleksand Atamanskyi on 10/28/19.
//  Copyright © 2019 Oleksand Atamanskyi. All rights reserved.
//

import Foundation

final class LoginPresenter {
    var loginInteractor: LoginInteractor
    
    init(loginInteractor: LoginInteractor) {
        self.loginInteractor = loginInteractor
    }
}
