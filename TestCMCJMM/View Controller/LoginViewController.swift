//
//  LoginViewController.swift
//  TestCMCJMM
//
//  Created by Grupo CMC Colombia on 14/08/19.
//  Copyright © 2019 CMC. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - Outlet
    
    @IBOutlet weak var textFieldUsername: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var buttonLogin: UIButton!
    @IBOutlet weak var imgUser: UIImageView!
    
    // MARK: - View

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.imgUser.moldToCircle()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func doMainVC() {
        let mainVC = storyboard?.instantiateViewController(withIdentifier: "MainVC")
        
        let transition = CATransition() // Transition
        transition.duration = 2
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        transition.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseOut)
        self.view.window!.layer.add(transition, forKey: kCATransition)

        present(mainVC!, animated: true, completion: nil)
        
    }
    
    // MARK: - Alert
    
    func doLoginKO(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { action in
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true) {}
    }

    // MARK: - Action
    
    @IBAction func doLogin(_ sender: Any) {
        LoginViewModel(loginViewController: self).doLogin()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UIImageView {
    func moldToCircle() {
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height/2.24
        self.clipsToBounds = true

    }
}
