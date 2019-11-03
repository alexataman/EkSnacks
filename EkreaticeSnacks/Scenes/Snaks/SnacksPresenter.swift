//
//  SnacksPresenter.swift
//  EkreaticeSnacks
//
//  Created by Alex on 10/29/19.
//  Copyright © 2019 Oleksand Atamanskyi. All rights reserved.
//
import UIKit

protocol SnacksPresenterOutput {
    func reload()
}

final class SnacksPresenter {
    private var snacksInteractor: SnacksInteractor
    private var tableView: UITableView?
    
    private lazy var dataSource = SnacksDataSource(tableView: tableView)
    
    init(snacksInteractor: SnacksInteractor) {
        self.snacksInteractor = snacksInteractor
    }
    
    func setDataSoure(tableView: UITableView) {
        self.tableView = tableView
        
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
    }
}

extension SnacksPresenter: SnacksPresenterOutput {
    func reload() {
        
    }
}
