//
//  Moya+Extension.swift
//  EkreativeSnacks
//
//  Created by Alex on 11/1/19.
//  Copyright © 2019 Oleksand Atamanskyi. All rights reserved.
//

import Moya
import PromiseKit

// Allows easy use of request as a promise
extension MoyaProvider {
    func request(_ target: Target, callbackQueue: DispatchQueue? = .none, progress: ProgressBlock? = .none) -> Promise<Response> {
        return Promise { seal in
            request(target, callbackQueue: callbackQueue, progress: progress) { result in
                switch result {
                case let .success(response):
                    do {
                        seal.fulfill(try response.filterSuccessfulStatusCodes())
                    } catch {
                        seal.reject(error)
                    }
                case let .failure(error):
                    seal.reject(error)
                }
            }
        }
    }
}

extension Promise where T == Response {
    func decode<T: Decodable>(to type: T.Type, atKeyPath keyPath: String?, using decoder: JSONDecoder = .init()) -> Promise<T> {
        return map(on: .global()) { response in
            try response.map(T.self, atKeyPath: keyPath, using: decoder)
        }
    }
}

func async(done: @escaping () -> Void) {
    DispatchQueue.main.async {
        done()
    }
}

func asyncAfter(deadline: TimeInterval, done: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + deadline) {
        done()
    }
}

