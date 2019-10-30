//
//  Button.swift
//  EkreativeSnacks
//
//  Created by Alex on 10/30/19.
//  Copyright © 2019 Oleksand Atamanskyi. All rights reserved.
//

import UIKit

final class Button: UIButton {
    
    // MARK: - IBInspectable

    @IBInspectable public var radius: CGFloat = 0.0 {
        didSet {
            setup()
        }
    }
    
    // MARK: - Init

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    // MARK: - Implementation

    private func setup() {
        layer.masksToBounds = true
        titleLabel?.adjustsFontSizeToFitWidth = true
        titleLabel?.lineBreakMode = .byClipping
        layer.cornerRadius = radius
    }
}
