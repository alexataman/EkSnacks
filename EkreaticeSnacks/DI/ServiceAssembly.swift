//
//  ServiceAssembly.swift
//  EkreaticeSnacks
//
//  Created by Alex on 10/28/19.
//  Copyright © 2019 Oleksand Atamanskyi. All rights reserved.
//

import Swinject
import SwinjectStoryboard

final class ServiceAssembly: Assembly {
    func assemble(container: Container) {
        container.register(Router.self) { resolver in
            return Router.shared
        }
    }
}
