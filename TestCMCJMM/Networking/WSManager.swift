//
//  RESTManager.swift
//  TestCMCJMM
//
//  Created by Grupo CMC Colombia on 14/08/19.
//  Copyright © 2019 CMC. All rights reserved.
//

import Foundation
import UIKit

class WSManager {
    
    // MARK: - Shared
    
    static let shared = WSManager()
    
    // MARK: - Charactr
    
    var model: MoldViewModel!
    
    // MARK: - Login
    
    func doLogin() {
        Requester().doLoginAndToken(OK: {
            result in
            
            self.model.doResponseOK()
            
        }, ErrorService: {
            errorBl in
            self.doLoginKO()
        }, endpoint: "\(Constant.url)/aut?password=\((model as! LoginViewModel).password!)&usuario=\((model as! LoginViewModel).username!)")

    }
    
    func doLoginOK() {
        self.model.doResponseOK()
    }
    
    func doLoginKO() {
        self.model.doResponseKO()
    }
    
    // MARK: - Summary
    
    func doSummary() {
        Requester().doSummary(OK: { result in
            
            var summary = [User]()
            for user in result {
                summary.append(User(dict: user as! NSDictionary))
            }
            (self.model as! SummaryViewModel).summary = summary
            self.doSummaryOK()
            
        }, ErrorService: { errorBl in
            self.doSummaryKO()
        }, endpoint: "\(Constant.url)/usuario")

    }
    
    func doSummaryOK() {
        self.model.doResponseOK()
    }
    
    func doSummaryKO() {
        self.model.doResponseKO()
    }

}
