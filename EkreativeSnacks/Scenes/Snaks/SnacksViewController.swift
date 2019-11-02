//
//  SnacksViewController.swift
//  EkreativeSnacks
//
//  Created by Alex on 10/29/19.
//  Copyright © 2019 Oleksand Atamanskyi. All rights reserved.
//

import UIKit

final class SnacksViewController: NoNavigationBarViewController, StoryboardLoadable {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var usernameLabel: UILabel!
    
    // MARK: - Dependencies
    
    var snacksPresenter: SnacksPresenter!
    
    // MARK: - View Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        snacksPresenter.setDataSoure(tableView: tableView)
        snacksPresenter.roundTableView()
        snacksPresenter.setUsername(userNameLabel: usernameLabel)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        snacksPresenter.fetchSnacks()
    }
    
    // MARK: - IBActions
    
    @IBAction private func logoutAction(_ sender: Any) {
        snacksPresenter.logout()
    }
    
    @IBAction private func addSnackAction(_ sender: Any) {
        snacksPresenter.showAddSnack()
    }
}
