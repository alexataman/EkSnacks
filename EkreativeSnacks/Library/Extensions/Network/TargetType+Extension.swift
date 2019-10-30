//
//  TargetType+Extension.swift
//  EkreativeSnacks
//
//  Created by Alex on 10/29/19.
//  Copyright © 2019 Oleksand Atamanskyi. All rights reserved.
//
import Moya

extension TargetType {
    
    var appServer: URL {
        guard let urlString = Bundle.main.object(forInfoDictionaryKey: "APP_SERVER") as? String, let baseUrl = URL(string: urlString) else {
            fatalError("Cannot get baseUrl")
        }
        return baseUrl
    }
}
