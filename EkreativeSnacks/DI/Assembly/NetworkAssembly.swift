//
//  NetworkAssembly.swift
//  EkreativeSnacks
//
//  Created by Alex on 10/29/19.
//  Copyright © 2019 Oleksand Atamanskyi. All rights reserved.
//
import Swinject
import SwinjectStoryboard

final class NetworkAssembly: Assembly {
    func assemble(container: Container) {
        container.register(SnackNetwork.self) { resolver in
            return .init(provider: MoyaFactory.make())
        }
    }
}
