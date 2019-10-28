//
//  Injector.swift
//  EkreaticeSnacks
//
//  Created by Oleksand Atamanskyi on 10/28/19.
//  Copyright © 2019 Oleksand Atamanskyi. All rights reserved.
//

import Swinject
import SwinjectStoryboard

final class Injector {
    
    //MARK: Shared
    
    static let shared = Injector()
    
    // MARK: Private properties
    
    private let container = SwinjectStoryboard.defaultContainer
    
    // MARK: Public properties
    
    let resolver: Resolver
    
    // MARK: Init
    
    private init() {
        resolver = Assembler([
            UserInterfaceAssembly(),
            ServiceAssembly()
        ], container: container).resolver
    }
    
    // MARK: - Implementation
    
    func load<Service>(_ serviceType: Service.Type, name: String? = nil) -> Service {
        guard let resolved = container.resolve(serviceType, name: name) else {
            fatalError("Couldn't resolve \(serviceType)")
        }
        return resolved
    }
}
