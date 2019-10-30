//
//  SnacksNetwork.swift
//  EkreativeSnacks
//
//  Created by Alex on 10/29/19.
//  Copyright © 2019 Oleksand Atamanskyi. All rights reserved.
//

import Moya

final class SnacksNetwork {
    private let provider: MoyaProvider<SnacksTargetType>
    
    init(provider: MoyaProvider<SnacksTargetType>) {
        self.provider = provider
    }
    
    func fetch() {
        
    }
}
