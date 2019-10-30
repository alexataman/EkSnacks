//
//  AddSnackTargetType.swift
//  EkreativeSnacks
//
//  Created by Alex on 10/30/19.
//  Copyright © 2019 Oleksand Atamanskyi. All rights reserved.
//

import Moya

enum AddSnackTargetType {
    case add(Snack)
}

extension AddSnackTargetType: TargetType {
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
        return "AddSnackJSON".contentsOfFile().data(using: .utf8) ?? .init()
    }

    var task: Task {
        switch self {
        case .add(let snack):
            return .requestJSONEncodable(snack)
        }
    }

    var validate: Bool {
        return false
    }

}
