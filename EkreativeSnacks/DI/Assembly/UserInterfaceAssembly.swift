//
//  UserInterfaceAssembly.swift
//  EkreativeSnacks
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
        registerAddSnackDependencies(container: container)
        
        // Storyboard init
        container.storyboardInitCompleted(LoginViewController.self) { resolver, controller in
            controller.loginPresenter = resolver.resolve(LoginPresenter.self)
        }
        container.storyboardInitCompleted(SnacksViewController.self) {
            resolver, controller in
            controller.snacksPresenter = resolver.resolve(SnacksPresenter.self)
        }
        container.storyboardInitCompleted(AddSnackViewController.self) { resolver, controller in
            controller.addSnackPresenter = resolver.resolve(AddSnackPresenter.self)
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
            controller.loginPresenterOutput = resolver.resolve(LoginPresenter.self)
            controller.keychainService = resolver.resolve(KeychainService.self)
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
            .init(snacksInteractor: resolver.resolve(SnacksInteractor.self)!,
                  keychainService: resolver.resolve(KeychainService.self)!,
                  snacksRouter: resolver.resolve(SnacksRouter.self)!)
        }
        container.register(SnacksInteractor.self) { resolver in
            .init()
        }.initCompleted { resolver, controller in
            controller.snackNetwork = resolver.resolve(SnackNetwork.self)
            controller.snacksPresenterOutput = resolver.resolve(SnacksPresenter.self)
        }
        container.register(SnacksRouter.self) { resolver in
            .init(router: resolver.resolve(Router.self)!)
        }
    }
}

// MARK: - Register AddSnack Dependencies

private extension UserInterfaceAssembly {
    func registerAddSnackDependencies(container: Container) {
        container.register(AddSnackPresenter.self) { _ in
            .init()
        }.initCompleted { resolver, controller in
            controller.addSnackInteractor = resolver.resolve(AddSnackInteractor.self)
            controller.addSnackRouter = resolver.resolve(AddSnackRouter.self)
            controller.keychainService = resolver.resolve(KeychainService.self)
        }
        container.register(AddSnackInteractor.self) { resolver in
            .init(snackNetwork: resolver.resolve(SnackNetwork.self)!)
        }
        container.register(AddSnackRouter.self) { resolver in
            .init(router: resolver.resolve(Router.self)!)
        }
    }
}
