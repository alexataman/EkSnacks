//
//  AddSnackNetwork.swift
//  EkreativeSnacks
//
//  Created by Alex on 10/30/19.
//  Copyright © 2019 Oleksand Atamanskyi. All rights reserved.
//

import Moya

final class AddSnackNetwork {
    private let provider: MoyaProvider<AddSnackTargetType>
    
    init(provider: MoyaProvider<AddSnackTargetType>) {
        self.provider = provider
    }
    
    func add(snack: Snack) {
        
    }
}
