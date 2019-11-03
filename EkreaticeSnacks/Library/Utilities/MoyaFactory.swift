//
//  MoyaFactory.swift
//  EkreaticeSnacks
//
//  Created by Alex on 10/29/19.
//  Copyright © 2019 Oleksand Atamanskyi. All rights reserved.
//

import Moya

final class MoyaFactory {
    static func make<T: TargetType>(_ plugins: [PluginType] = []) -> MoyaProvider<T> {
        return MoyaProvider<T>()
    }
}
