//
//  Validatable.swift
//  EkreativeSnacks
//
//  Created by Alex on 10/31/19.
//  Copyright © 2019 Oleksand Atamanskyi. All rights reserved.
//

import Foundation

protocol ValidatableValue {}

extension ValidatableValue {
    
    private var throwError: Never {
        fatalError("Validatable.swift: Expected 'String' but argument is of type '\(self)'")
    }
    
    var asString: String {
        guard let value = self as? String else {
            throwError
        }
        return value
    }
    
    var asInt: Int {
        guard let value = self as? Int else {
            throwError
        }
        return value
    }
    
}

extension String: ValidatableValue {}
extension Int: ValidatableValue {}

protocol Validatable {
    func validate<T: ValidatableValue>(rule: ValidationRulePattern, value: T, repeated: String) throws
}

extension Validatable {
    func validate<T: ValidatableValue>(rule: ValidationRulePattern, value: T, repeated: String = "") throws {
        switch rule {
        case .firstName where value.asString.isEmpty:
            throw ValidationRulePattern.firstName
        case .lastName where value.asString.isEmpty:
            throw ValidationRulePattern.lastName
        case .date where value.asString.isEmpty:
            throw ValidationRulePattern.date
        case .price where value.asInt == 0:
            throw ValidationRulePattern.price
        case .name where value.asString.isEmpty:
            throw ValidationRulePattern.name
        default:
            break
        }
    }
}

enum ValidationRulePattern: Error {
    case firstName
    case lastName
    case date
    case price
    case name
    
    func errorMessage() -> String {
        switch self {
        case .firstName:
            return "First name can not be empty"
        case .lastName:
            return "First name can not be empty"
        case .date:
            return "Date can not be blank"
        case .price:
            return "Price can not be blank"
        case .name:
            return "Name can not be blank"
        }
    }
}
