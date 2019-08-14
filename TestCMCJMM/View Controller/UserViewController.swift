//
//  UserViewController.swift
//  TestCMCJMM
//
//  Created by Grupo CMC Colombia on 14/08/19.
//  Copyright © 2019 CMC. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    // MARK: - Character
    
    var userViewModel: UserViewModel!
    
    // MARK: - Outlet
    
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var cedula: UILabel!
    @IBOutlet weak var celular: UILabel!
    @IBOutlet weak var direccion: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var imgUser: UIImageView!
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.nombre.text = self.userViewModel.user.nombre
        self.cedula.text = String(self.userViewModel.user.cedula)
        self.celular.text = String(self.userViewModel.user.celular)
        self.direccion.text = self.userViewModel.user.direccion
        self.email.text = self.userViewModel.user.email
        self.imgUser.moldToCircle()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
