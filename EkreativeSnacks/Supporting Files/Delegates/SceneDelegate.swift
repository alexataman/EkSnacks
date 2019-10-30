//
//  SceneDelegate.swift
//  EkreativeSnacks
//
//  Created by Oleksand Atamanskyi on 10/28/19.
//  Copyright © 2019 Oleksand Atamanskyi. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScrene = (scene as? UIWindowScene) else { return }
        window = .init(windowScene: windowScrene)
        loadFirstView()
        window?.makeKeyAndVisible()
    }
    
    private func loadFirstView() {
           let router = Injector.shared.load(Router.self)
           
           router.present(route: .startUp(window))
       }

}

