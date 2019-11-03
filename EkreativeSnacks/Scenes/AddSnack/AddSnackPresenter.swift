//
//  AddSnackPresenter.swift
//  EkreativeSnacks
//
//  Created by Alex on 10/30/19.
//  Copyright © 2019 Oleksand Atamanskyi. All rights reserved.
//

import UIKit

final class AddSnackPresenter {
    
    // MARK: - Dependencies
    
    var addSnackRouter: AddSnackRouter?
    var addSnackInteractor: AddSnackInteractor?
    var keychainService: KeychainService?
    
    // MARK: - Private properties
    
    private weak var dateTextField: UITextField?
    private var selectedDateString = ""
    
    // MARK: - Public functions
    
    func setInputView(dateTextField: UITextField) {
        self.dateTextField = dateTextField
        dateTextField.setInputViewDatePicker(target: self, selector: #selector(tapDone))
    }
    
    func sendSnack(name: String, price: Int) {
        guard let user = keychainService?.get(key: KeychainKeys.userData) else {
            return
        }
        
        let snack = Snack(id: nil,
                          name: name,
                          user: user,
                          date: selectedDateString,
                          price: price)
        
        guard validate(snack: snack) else {
            return
        }
        
        addSnackInteractor?.send(snack: snack)
    }
    
    // MARK: - Private functions
    
    @objc
    private func tapDone() {
        if let datePicker = dateTextField?.inputView as? UIDatePicker {
            let dateformatter = DateFormatter()
            dateformatter.dateStyle = .medium
            selectedDateString = Date.iso8601Full.string(from: datePicker.date)
            dateTextField?.text = dateformatter.string(from: datePicker.date)
        }
        dateTextField?.resignFirstResponder()
    }
}

extension AddSnackPresenter: Validatable {
    func validate(snack: Snack) -> Bool {
        do {
            try validate(rule: .date, value: snack.date)
            try validate(rule: .price, value: snack.price)
            try validate(rule: .name, value: snack.name)
            
            return true
        } catch {
            if let validationError = error as? ValidationRulePattern {
                // need to add spinner
            }
            
            return false
        }
    }
}
