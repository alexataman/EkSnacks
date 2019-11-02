//
//  SnacksTargetType.swift
//  EkreativeSnacks
//
//  Created by Alex on 10/29/19.
//  Copyright © 2019 Oleksand Atamanskyi. All rights reserved.
//
import Moya

enum SnackTargetType {
    case fetch
    case post(Snack)
}

extension SnackTargetType: TargetType {
    var headers: [String: String]? {
        return nil
    }

    var baseURL: URL { return appServer }

    var path: String {
        return "items"
    }

    var method: Moya.Method {
        switch self {
        case .fetch:
            return .get
        case .post:
            return .post
        }
    }

    var parameters: [String: Any]? {
        return nil
    }

    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }

    var sampleData: Data {
        return "SnackJson".contentsOfFile().data(using: .utf8) ?? .init()
    }

    var task: Task {
        switch self {
        case .fetch:
            return .requestPlain
        case .post(let snack):
            return .requestJSONEncodable(snack)
        }
    }

    var validate: Bool {
        return false
    }
}
