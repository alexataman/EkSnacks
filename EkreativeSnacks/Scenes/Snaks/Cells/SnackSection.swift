//
//  SnackSection.swift
//  EkreativeSnacks
//
//  Created by Alex on 11/1/19.
//  Copyright © 2019 Oleksand Atamanskyi. All rights reserved.
//

import UIKit

final class SnackSection: UITableViewHeaderFooterView {
    
    @IBOutlet private weak var dayLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    
    func setup(snacks: [Snack]) {
        priceLabel.text = snacks.map { $0.price }.reduce(0, +).toString() + " uah"
        dayLabel.text = snacks.first?.date.day.dayOfMonth
    }
}
