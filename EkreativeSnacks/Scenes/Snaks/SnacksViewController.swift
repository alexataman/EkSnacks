//
//  SnacksViewController.swift
//  EkreativeSnacks
//
//  Created by Alex on 10/29/19.
//  Copyright © 2019 Oleksand Atamanskyi. All rights reserved.
//

import UIKit

final class SnacksViewController: UIViewController, StoryboardLoadable {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Dependencies
    
    var snacksPresenter: SnacksPresenter!
    
    // MARK: - View Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        snacksPresenter.setDataSoure(tableView: tableView)
    }
}
