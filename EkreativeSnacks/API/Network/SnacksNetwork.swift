//
//  SnackNetwork.swift
//  EkreativeSnacks
//
//  Created by Alex on 10/29/19.
//  Copyright © 2019 Oleksand Atamanskyi. All rights reserved.
//

import Moya
import PromiseKit

final class SnackNetwork {
    private let provider: MoyaProvider<SnackTargetType>
    
    init(provider: MoyaProvider<SnackTargetType>) {
        self.provider = provider
    }
    
    func fetch() -> Promise<[Snack]> {
        return provider.request(.fetch).map { response in
            _ = try response.filterSuccessfulStatusCodes()
            
            return [
                Snack(name: "Lol", user: "asd", date: "2017-02-09T12:56:37.001Z", price: 150),
                Snack(name: "New", user: "asd", date: "2017-02-09T18:26:30.001Z", price: 15),
                Snack(name: "Abs", user: "asd", date: "2019-08-11T12:56:37.001Z", price: 180)
            ]
        }
    }
    
    func post(snack: Snack) -> Promise<Void> {
        return provider.request(.post(snack)).asVoid()
    }
}
