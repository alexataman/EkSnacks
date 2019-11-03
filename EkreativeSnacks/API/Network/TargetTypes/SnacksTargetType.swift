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
    case delete(Int)
}

extension SnackTargetType: TargetType {
    var headers: [String: String]? {
        return nil
    }

    var baseURL: URL { return appServer }

    var path: String {
        switch self {
        case .fetch, .post:
            return "items"
        case .delete(let id):
            return "items/\(id)"
        }
    }

    var method: Moya.Method {
        switch self {
        case .fetch:
            return .get
        case .post:
            return .post
        case .delete:
            return .delete
        }
    }

    var parameters: [String: Any]? {
        return nil
    }

    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }

    var sampleData: Data {
        return .init()
    }

    var task: Task {
        switch self {
        case .fetch, .delete:
            return .requestPlain
        case .post(let snack):
            return .requestJSONEncodable(snack)
        }
    }

    var validate: Bool {
        return false
    }
}
