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
        registerSnacksDependencies(container: container)
        
        // Storyboard init
        container.storyboardInitCompleted(LoginViewController.self) { resolver, controller in
            controller.loginPresenter = resolver.resolve(LoginPresenter.self)
        }
        container.storyboardInitCompleted(SnacksViewController.self) {
            resolver, controller in
            controller.snacksPresenter = resolver.resolve(SnacksPresenter.self)
        }
    }
}

// MARK: Register Login Dependencies

private extension UserInterfaceAssembly {
    func registerLoginDependencies(container: Container) {
        container.register(LoginPresenter.self) { resolver in
            .init(loginInteractor: resolver.resolve(LoginInteractor.self)!,
                  loginRouter: resolver.resolve(LoginRouter.self)!)
        }
        container.register(LoginInteractor.self) { _ in
            .init()
        }.initCompleted { resolver, controller in
            controller.loginNetwork = resolver.resolve(LoginNetwork.self)
            controller.loginPresenterOutput = resolver.resolve(LoginPresenter.self)
        }
        container.register(LoginRouter.self) { resolver in
            .init(router: resolver.resolve(Router.self)!)
        }
    }
}

// MARK: Register Snacks Dependencies

private extension UserInterfaceAssembly {
    func registerSnacksDependencies(container: Container) {
        container.register(SnacksPresenter.self) { resolver in
            .init(snacksInteractor: resolver.resolve(SnacksInteractor.self)!)
        }
        container.register(SnacksInteractor.self) { resolver in
            .init()
        }.initCompleted { resolver, controller in
            controller.snacksNetwork = resolver.resolve(SnacksNetwork.self)
            controller.snacksRouter = resolver.resolve(SnacksRouter.self)
            controller.snacksPresenterOutput = resolver.resolve(SnacksPresenter.self)
        }
        container.register(SnacksRouter.self) { resolver in
            .init(router: resolver.resolve(Router.self)!)
        }
    }
}
