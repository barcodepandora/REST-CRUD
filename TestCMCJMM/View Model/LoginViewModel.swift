//
//  LoginViewModel.swift
//  TestCMCJMM
//
//  Created by Grupo CMC Colombia on 14/08/19.
//  Copyright © 2019 CMC. All rights reserved.
//

import Foundation

class LoginViewModel: MoldViewModel {
    
    // MARK: - Character
    
    private var loginViewController: LoginViewController!
    var username: String?
    var password: String?
    
    // MARK: - Init
    
    public init(loginViewController: LoginViewController) {
        self.loginViewController = loginViewController
        self.username = self.loginViewController.textFieldUsername.text
        self.password = self.loginViewController.textFieldPassword.text
    }
    
    // MARK: - Model
    
    func doLogin() {
        if self.isUsernameOK() && self.isPasswordOK() {
            WSManager.shared.model = self
                WSManager.shared.doLogin()
        } else {
            self.loginViewController.doLoginKO(title: "Error", message: "Usuario/Clave incompletos")
        }
    }
    
    func isUsernameOK() -> Bool {
        return !(self.username == "")
    }
    
    func isPasswordOK() -> Bool {
        return !(self.password == "")
    }

    // MARK: - Override
    
    override func doResponseOK() {
        self.loginViewController.doMainVC()
    }

    override func doResponseKO() {
        self.loginViewController.doLoginKO(title: "Error", message: "Error de servidor")
    }
    
}
