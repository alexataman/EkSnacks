//
//  UnexpectedNilError.swift
//  KidsloxTests
//
//  Created by Alex on 10.01.18.
//  Copyright © 2018 Kidslox. All rights reserved.
//
import XCTest

struct UnexpectedNilError: Error {}

// swiftlint:disable identifier_name
func AssertNotNilAndUnwrap<T>(_ variable: T?, message: String = "Unexpected nil variable", file: StaticString = #file, line: UInt = #line) throws -> T {
    guard let variable = variable else {
        XCTFail(message, file: file, line: line)
        throw UnexpectedNilError()
    }
    return variable
}
