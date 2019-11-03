//
//  SnackCell.swift
//  EkreativeSnacks
//
//  Created by Alex on 11/1/19.
//  Copyright © 2019 Oleksand Atamanskyi. All rights reserved.
//

import UIKit

final class SnackCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var snackNameLabel: UILabel!
    @IBOutlet private weak var snackPriceLabel: UILabel!
    
    // MARK: - Implementation
    
    func setup(snack: Snack) {
        snackNameLabel.text = snack.name
        snackPriceLabel.text = "\(snack.price)"
    }
}
