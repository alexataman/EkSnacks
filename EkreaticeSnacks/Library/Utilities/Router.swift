//
//  Router.swift
//  EkreaticeSnacks
//
//  Created by Oleksand Atamanskyi on 10/28/19.
//  Copyright © 2019 Oleksand Atamanskyi. All rights reserved.
//

import UIKit

// MARK: - Routes

enum Route {
    case startUp(UIWindow?)
    case login
    case snacks
    case addSnack
}

final class Router {
    private let navigationController = UINavigationController()
    
    // MARK: - Present route
    
    func present(route: Route) {
        switch route {
        case .login:
            break
        case .snacks:
            showSnacks()
        case .addSnack:
            break
        case .startUp(let window):
            showStartUp(window: window)
        }
    }
    
    // MARK: - Load storyboards
    
    private func showStartUp(window: UIWindow?) {
        // check keychain storage
        window?.rootViewController = navigationController
        showLogin()
    }
    
    private func showLogin() {
        let loginVC = LoginViewController.loadFromStoryboard()
        navigationController.viewControllers = [loginVC]
    }
    
    private func showSnacks() {
        let snacksVC = SnacksViewController.loadFromStoryboard()
        navigationController.viewControllers = [snacksVC]
    }
}

// MARK: - Shared preferences

extension Router {
    static let shared = Router()
}
