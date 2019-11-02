//
//  SnacksDataSource.swift
//  EkreativeSnacks
//
//  Created by Alex on 10/29/19.
//  Copyright © 2019 Oleksand Atamanskyi. All rights reserved.
//

import UIKit

final class SnacksDataSource: NSObject {
    
    // MARK: - Public properties
    
    internal weak var tableView: UITableView?
    
    // MARK: - Private properties
    
    private var snacks: [Snack] = []
    private lazy var values = sections.map { $0.value }
    private var sections: [String: [Snack]] {
        let sortedSnacks = snacks.sorted { $0.date < $1.date }
        return Dictionary(grouping: sortedSnacks) {
            $0.date.day.current
        }
    }
    
    // MARK: - Identifiers
    
    private let snackCellIdentifier = "SnackCell"
    private let snackSectionIdentifier = "SnackSection"
    private let emptyCellIdentifier = "EmptyCell"
    
    // MARK: - Init
    
    init(tableView: UITableView?) {
        self.tableView = tableView
        super.init()
        
        registerCells()
    }
    
    private func registerCells() {
        tableView?.register(
            .init(nibName: snackCellIdentifier, bundle: nil), forCellReuseIdentifier: snackCellIdentifier)
        tableView?.register(
            .init(nibName: snackSectionIdentifier, bundle: nil), forHeaderFooterViewReuseIdentifier: snackSectionIdentifier)
        tableView?.register(
            .init(nibName: emptyCellIdentifier, bundle: nil), forCellReuseIdentifier: emptyCellIdentifier)
    }
    
}

// MARK: -

extension SnacksDataSource {
    func reload(snacks: [Snack]) {
        self.snacks = snacks
        
        tableView?.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension SnacksDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.isEmpty ? 1 : sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.isEmpty ? 1 : values[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if sections.isEmpty {
            return tableView.dequeueReusableCell(withIdentifier: emptyCellIdentifier) ?? .init()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: snackCellIdentifier) as? SnackCell
        cell?.setup(snack: values[indexPath.section][indexPath.row])
        
        return cell ?? .init()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return sections.isEmpty ? tableView.frame.height : 72
    }
    
    // MARK: - Section
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return sections.isEmpty ? 0 : 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: snackSectionIdentifier) as? SnackSection
        headerView?.setup(snacks: values[section])
        
        return headerView
    }
}

// MARK: - UITableViewDelegate

extension SnacksDataSource: UITableViewDelegate {}
