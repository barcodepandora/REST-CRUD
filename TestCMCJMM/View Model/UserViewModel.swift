//
//  UserViewModel.swift
//  TestCMCJMM
//
//  Created by Grupo CMC Colombia on 14/08/19.
//  Copyright © 2019 CMC. All rights reserved.
//

import Foundation
import UIKit

class UserViewModel: MoldViewModel {
    
    // MARK: - Character
    
    var userViewController: UserViewController!
    var user: User!
    var ancestor: UIViewController!
    
    // MARK: - Init
    
    public init(userViewController: UserViewController) {
        self.userViewController = userViewController
    }
    
    public override init() {
    }
    
    // MARK: - Model
    
    func launchViewController() {
        var userVC: UserViewController = self.ancestor.storyboard?.instantiateViewController(withIdentifier: "User") as! UserViewController
        userVC.userViewModel = self
        
        let transition = CATransition() // Transition
        transition.duration = 2
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        transition.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseOut)
        self.ancestor.view.window!.layer.add(transition, forKey: kCATransition)

        self.ancestor.present(userVC, animated: true, completion: nil)

    }
    
    // MARK: - Override
    
    override func doResponseOK() {
    }
    
    override func doResponseKO() {
    }
    
}
