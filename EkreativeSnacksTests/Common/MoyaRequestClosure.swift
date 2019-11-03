//
//  MoyaRequestClosure.swift
//  KidsloxTests
//
//  Created by Alex on 19.01.18.
//  Copyright © 2018 Kidslox. All rights reserved.
//

import Alamofire
import Moya

func configurate<T: TargetType>(_: T.Type, data: Data = .init(), callback: @escaping (Alamofire.HTTPMethod?, [String: String]?, String?) -> Void) -> MoyaProvider<T>.RequestClosure {
    let configurations: MoyaProvider<T>.RequestClosure = { configurations, done in
        do {
            let urlRequest = try configurations.urlRequest()
            done(.success(urlRequest))
        } catch MoyaError.requestMapping(let url) {
            done(.failure(MoyaError.requestMapping(url)))
        } catch {
            done(.failure(MoyaError.parameterEncoding(error)))
        }
        
        callback(configurations.method, configurations.httpHeaderFields, configurations.url)
    }

    return configurations
}

func endpointClosure(_ target: TargetType, data: Data) -> Endpoint {
    return Endpoint(
        url: target.baseURL.absoluteString,
        sampleResponseClosure: { .networkResponse(200, data) },
        method: target.method,
        task: target.task,
        httpHeaderFields: target.headers)
}
