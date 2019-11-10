//
//  SnacksRouter.swift
//  EkreativeSnacks
//
//  Created by Alex on 10/29/19.
//  Copyright © 2019 Oleksand Atamanskyi. All rights reserved.
//

//sourcery: AutoMockable
protocol SnacksRouterInput {
    func showLogin()
    func showAddSnack()
}

final class SnacksRouter: SnacksRouterInput {
    private var router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func showLogin() {
        router.present(route: .login)
    }
    
    func showAddSnack() {
        router.present(route: .addSnack)
    }
}
