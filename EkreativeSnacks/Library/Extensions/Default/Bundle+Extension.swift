//
//  Bundle+Extension.swift
//  EkreativeSnacks
//
//  Created by Alex on 11/3/19.
//  Copyright © 2019 Oleksand Atamanskyi. All rights reserved.
//

import Foundation

extension Bundle {
    func json(name: String) -> Data {
        return url(forResource: name, withExtension: "json")
        .flatMap { try? Data(contentsOf: $0) } ?? .init()
    }
}
