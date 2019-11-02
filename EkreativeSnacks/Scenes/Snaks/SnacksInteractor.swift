//
//  SnacksInteractor.swift
//  EkreativeSnacks
//
//  Created by Alex on 10/29/19.
//  Copyright © 2019 Oleksand Atamanskyi. All rights reserved.
//

final class SnacksInteractor {
    var snackNetwork: SnackNetwork?
    var snacksPresenterOutput: SnacksPresenterOutput?
    
    func fetchSnacks() {
        snackNetwork?.fetch().done { [weak self] snacks in
            async {
                self?.snacksPresenterOutput?.reloadData(with: snacks)
            }
        }.cauterize()
    }
}
