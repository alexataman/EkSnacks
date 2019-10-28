//
//  UserInterfaceAssembly.swift
//  EkreaticeSnacks
//
//  Created by Oleksand Atamanskyi on 10/28/19.
//  Copyright © 2019 Oleksand Atamanskyi. All rights reserved.
//

import SwinjectStoryboard
import Swinject

final class UserInterfaceAssembly: Assembly {
    func assemble(container: Container) {
        // Register Dependencies
        registerLoginDependencies(container: container)
        
        // Storyboard init
        container.storyboardInitCompleted(LoginViewController.self) { resolver, controller in
            controller.loginPresenter = resolver.resolve(LoginPresenter.self)
        }
    }
}

// MARK: Register Login Dependencies

private extension UserInterfaceAssembly {
    func registerLoginDependencies(container: Container) {
        container.register(LoginPresenter.self) { resolver in
            .init(loginInteractor: resolver.resolve(LoginInteractor.self)!)
        }
        container.register(LoginInteractor.self) { resolver in
            .init(loginRouter: resolver.resolve(LoginRouter.self)!)
        }
        container.register(LoginRouter.self) { _ in
            .init()
        }
    }
}
