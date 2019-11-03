//
//  NetworkQuickSpec.swift
//  KidsloxTests
//
//  Created by Oleksandr Atamanskyi on 3/16/18.
//  Copyright © 2018 Kidslox. All rights reserved.
//

import Alamofire
import Quick
import Moya

@testable import EkreativeSnacks

enum NetworkType {
    case snack(MoyaProvider<SnackTargetType>)
}

protocol NetworkProtocol {

    associatedtype NetworkType

    var method: Alamofire.HTTPMethod? { get }
    var headers: [String: String]? { get }
    var url: String? { get }

    var network: NetworkType? { get }
}

extension NetworkProtocol {

    var baseURL: URL {
        get {
            guard let urlString = Bundle(for: SnackNetworkTest.self).object(forInfoDictionaryKey: "APP_SERVER") as? String, let baseUrl = URL(string: urlString) else {
                fatalError("Cannot get baseUrl")
            }
            return baseUrl
        }
        set {}
    }
}
