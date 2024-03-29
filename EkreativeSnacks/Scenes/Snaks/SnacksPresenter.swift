//
//  SnacksPresenter.swift
//  EkreativeSnacks
//
//  Created by Alex on 10/29/19.
//  Copyright © 2019 Oleksand Atamanskyi. All rights reserved.
//
import UIKit

protocol SnacksPresenterOutput {
    func reloadData(with snacks: [Snack])
}

protocol SnacksPresenterInput {
    func setDataSoure(tableView: UITableView)
    func roundTableView()
    func setUsername(userNameLabel: UILabel)
    func fetchSnacks()
    func logout()
    func showAddSnack()
}

final class SnacksPresenter {
    private var snacksInteractor: SnacksInteractorInput
    private var keychainService: KeychainService
    private var snacksRouter: SnacksRouterInput
    
    private var tableView: UITableView?
    
    private lazy var dataSource = SnacksDataSource(tableView: tableView)
    
    init(snacksInteractor: SnacksInteractorInput, keychainService: KeychainService, snacksRouter: SnacksRouterInput) {
        self.snacksInteractor = snacksInteractor
        self.keychainService = keychainService
        self.snacksRouter = snacksRouter
    }
    
    func setDataSoure(tableView: UITableView) {
        self.tableView = tableView
        
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        
        dataSource.deleteAction = snacksInteractor.delete
    }
    
    func roundTableView() {
        tableView?.clipsToBounds = true
        tableView?.layer.cornerRadius = 8
        tableView?.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    func setUsername(userNameLabel: UILabel) {
        userNameLabel.text = keychainService.get(key: KeychainKeys.userData)
    }
    
    func fetchSnacks() {
        snacksInteractor.fetchSnacks()
    }
    
    func logout() {
        keychainService.delete(key: KeychainKeys.userData)
        snacksRouter.showLogin()
    }
    
    func showAddSnack() {
        snacksRouter.showAddSnack()
    }
}

extension SnacksPresenter: SnacksPresenterOutput {
    func reloadData(with snacks: [Snack]) {
        dataSource.reload(snacks: snacks)
    }
}

extension SnacksPresenter: SnacksPresenterInput {}
