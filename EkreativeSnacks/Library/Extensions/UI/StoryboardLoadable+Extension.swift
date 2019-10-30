//
//  StoryboardLoadable+Extension.swift
//  EkreativeSnacks
//
//  Created by Alex on 10/28/19.
//  Copyright © 2019 Oleksand Atamanskyi. All rights reserved.
//
import UIKit

protocol StoryboardLoadable: class {
    static var storyboardIdentifier: String { get }
    static var storyboardName: String { get }

    static func loadFromStoryboard(name: String?) -> Self
}

extension StoryboardLoadable where Self: UIViewController {
    static var storyboardIdentifier: String { return String(describing: Self.self) }
    static var storyboardName: String { return String(describing: Self.self) }

    static func loadFromStoryboard(name: String? = nil) -> Self {
        let storyboard = UIStoryboard(name: name ?? storyboardName, bundle: nil)

        guard let viewController = storyboard
            .instantiateViewController(withIdentifier: storyboardIdentifier) as? Self else {

                fatalError("UIStoryboardLoadable: can not load viewcontroller with identifier '\(storyboardIdentifier)' from storyboard.")
        }
        return viewController
    }
}
