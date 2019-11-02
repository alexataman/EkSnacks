//
//  AddSnackInteractor.swift
//  EkreativeSnacks
//
//  Created by Alex on 10/30/19.
//  Copyright © 2019 Oleksand Atamanskyi. All rights reserved.
//

import Foundation

final class AddSnackInteractor {
    private let snackNetwork: SnackNetwork
    
    init(snackNetwork: SnackNetwork) {
        self.snackNetwork = snackNetwork
    }
    
    func send(snack: Snack) {
        snackNetwork.post(snack: snack).cauterize()
    }
}
