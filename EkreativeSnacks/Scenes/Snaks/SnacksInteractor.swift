//
//  SnacksInteractor.swift
//  EkreativeSnacks
//
//  Created by Alex on 10/29/19.
//  Copyright © 2019 Oleksand Atamanskyi. All rights reserved.
//

//sourcery: AutoMockable
protocol SnacksInteractorInput {
    func fetchSnacks()
    func delete(id: Int)
    
    var snackNetwork: SnackNetwork? { get set }
    var snacksPresenterOutput: SnacksPresenterOutput? { get set }
}

final class SnacksInteractor: SnacksInteractorInput {
    var snackNetwork: SnackNetwork?
    var snacksPresenterOutput: SnacksPresenterOutput?
    
    func fetchSnacks() {
        snackNetwork?.fetch().done { [weak self] snacks in
            async {
                self?.snacksPresenterOutput?.reloadData(with: snacks)
            }
        }.cauterize()
    }
    
    func delete(id: Int) {
        snackNetwork?.delete(id: id).cauterize()
    }
}
