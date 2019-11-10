//
//  KeychainTest.swift
//  EkreativeSnacksTests
//
//  Created by Alex on 11/10/19.
//  Copyright © 2019 Oleksand Atamanskyi. All rights reserved.
//

import Quick
import Nimble

@testable import EkreativeSnacks

final class KeychainTest: QuickSpec {
    
    private var snacksPresenter: SnacksPresenterInput?
    
    private let keychainMock = KeychainService(keyPrefix: KeychainService.Prefix.test)
    private let userData = "Alex"
    
    override func spec() {
        describe("Test keychain service in snack presenter") {
            beforeEach {
                Injector.shared.register(module: .snacksPresenter)
                self.snacksPresenter = Injector.shared.load(SnacksPresenterInput.self)
            }
            
            afterEach {
                self.keychainMock.clear()
            }
            
            it("Test 'setUsername' function") {
                self.keychainMock.set(value: self.userData, key: KeychainKeys.userData)
                
                let label = UILabel()
                self.snacksPresenter?.setUsername(userNameLabel: label)
                
                expect(label.text) == self.userData
            }
            
            it("Test 'logout' function") {
                self.keychainMock.set(value: self.userData, key: KeychainKeys.userData)
                
                self.snacksPresenter?.logout()
                
                expect(self.keychainMock.get(key: KeychainKeys.userData)).to(beEmpty())
            }
        }
    }
}
