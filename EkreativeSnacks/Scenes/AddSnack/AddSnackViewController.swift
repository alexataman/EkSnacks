//
//  AddSnackViewController.swift
//  EkreativeSnacks
//
//  Created by Alex on 10/30/19.
//  Copyright © 2019 Oleksand Atamanskyi. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

final class AddSnackViewController: UIViewController, StoryboardLoadable {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var dateTextField: SkyFloatingLabelTextField!
    @IBOutlet private weak var productTextField: SkyFloatingLabelTextField!
    @IBOutlet private weak var priceTextField: SkyFloatingLabelTextField!
    
    // MARK: - Dependencies
    
    var addSnackPresenter: AddSnackPresenter!
    
    // MARK: - View controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSnackPresenter.setInputView(dateTextField: dateTextField)
    }
    
    // MARK: - IBActions
    
    @IBAction private func closeAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction private func addAction(_ sender: Any) {
        guard let name = productTextField.text,
            let price = priceTextField.text else {
            return
        }
        
        addSnackPresenter.sendSnack(name: name, price: price.toInt())
    }
}
