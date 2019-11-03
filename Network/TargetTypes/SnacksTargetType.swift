//
//  SnacksTargetType.swift
//  EkreaticeSnacks
//
//  Created by Alex on 10/29/19.
//  Copyright © 2019 Oleksand Atamanskyi. All rights reserved.
//
import Moya

enum SnacksTargetType {
    case fetch
}

extension SnacksTargetType: TargetType {
    var headers: [String: String]? {
        return nil
    }

    var baseURL: URL { return appServer }

    var path: String {
        return ""
    }

    var method: Moya.Method {
        return .get
    }

    var parameters: [String: Any]? {
        return nil
    }

    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }

    var sampleData: Data {
        return "SnacksJson".contentsOfFile().data(using: .utf8) ?? .init()
    }

    var task: Task {
        return .requestPlain
    }

    var validate: Bool {
        return false
    }
}
