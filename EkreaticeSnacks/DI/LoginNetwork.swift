//
//  LoginNetwork.swift
//  EkreaticeSnacks
//
//  Created by Alex on 10/29/19.
//  Copyright © 2019 Oleksand Atamanskyi. All rights reserved.
//

import Moya

final class LoginNetwork {
    private let provider: MoyaProvider<LoginTargetType>
    
    init(provider: MoyaProvider<LoginTargetType>) {
        self.provider = provider
    }
    
    func login() {
        
    }
}
