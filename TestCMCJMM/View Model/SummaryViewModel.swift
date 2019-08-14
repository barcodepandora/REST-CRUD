//
//  SummaryViewModel.swift
//  TestCMCJMM
//
//  Created by Grupo CMC Colombia on 14/08/19.
//  Copyright © 2019 CMC. All rights reserved.
//

import Foundation

class SummaryViewModel: MoldViewModel {
    
    // MARK: - Character
    
    private var summaryViewController: SummaryViewController!
    var summary = [User]()
    
    // MARK: - Init
    
    public init(summaryViewController: SummaryViewController) {
        self.summaryViewController = summaryViewController
    }
    
    // MARK: - Model
    
    func doSummary() {
        WSManager.shared.model = self
            WSManager.shared.doSummary()
    }
    
    // MARK: - Override
    
    override func doResponseOK() {
        self.summaryViewController.tableView.reloadData()
    }
    
    override func doResponseKO() {
        self.summaryViewController.doSummaryKO(title: "Error", message: "Error de servidor")
    }

}
