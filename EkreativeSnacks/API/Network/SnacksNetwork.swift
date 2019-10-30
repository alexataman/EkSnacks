//
//  SnackNetwork.swift
//  EkreativeSnacks
//
//  Created by Alex on 10/29/19.
//  Copyright © 2019 Oleksand Atamanskyi. All rights reserved.
//

import Moya

final class SnackNetwork {
    private let provider: MoyaProvider<SnackTargetType>
    
    init(provider: MoyaProvider<SnackTargetType>) {
        self.provider = provider
    }
    
    func fetch() {
        
    }
}
