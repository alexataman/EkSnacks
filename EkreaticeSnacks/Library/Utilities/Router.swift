//
//  Router.swift
//  EkreaticeSnacks
//
//  Created by Oleksand Atamanskyi on 10/28/19.
//  Copyright © 2019 Oleksand Atamanskyi. All rights reserved.
//

import UIKit

protocol Route { func start() }

final class Router {
    private lazy var navigationController = UINavigationController()
    
    func present(route: Route) {
        route.start()
    }
}
