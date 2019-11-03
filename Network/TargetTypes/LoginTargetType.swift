//
//  LoginTargetType.swift
//  EkreaticeSnacks
//
//  Created by Alex on 10/29/19.
//  Copyright © 2019 Oleksand Atamanskyi. All rights reserved.
//
import Moya

enum LoginTargetType {
    case login(User)
}

extension LoginTargetType: TargetType {
    var headers: [String: String]? {
        return nil
    }

    var baseURL: URL { return appServer }

    var path: String {
        return ""
    }

    var method: Moya.Method {
        return .post
    }

    var parameters: [String: Any]? {
        return nil
    }

    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }

    var sampleData: Data {
        return "LoginJson".contentsOfFile().data(using: .utf8) ?? .init()
    }

    var task: Task {
        switch self {
        case .login(let user):
            return .requestJSONEncodable(user)
        }
    }

    var validate: Bool {
        return false
    }
}
