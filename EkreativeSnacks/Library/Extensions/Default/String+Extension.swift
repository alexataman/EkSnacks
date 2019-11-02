//
//  String+Extension.swift
//  EkreativeSnacks
//
//  Created by Alex on 10/29/19.
//  Copyright © 2019 Oleksand Atamanskyi. All rights reserved.
//
import Foundation

extension String {
    func contentsOfFile() -> String {
        if let path = Bundle.main.path(forResource: self, ofType: "json") {
            do {
                let text = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
                return text
            } catch { fatalError("Failed to read text from bundle file \(self)") }
        } else { fatalError("Failed to load file from bundle \(self)") }
    }
    
    var day: Date {
        return Date.iso8601Full.date(from: self) ?? .init()
    }
    
    func toInt() -> Int {
        return Int(self) ?? 0
    }
}
