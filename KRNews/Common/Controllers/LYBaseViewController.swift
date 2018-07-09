//
//  LYBaseViewController.swift
//  KRNews
//
//  Created by test on 2018/07/09.
//  Copyright © 2018 liyan. All rights reserved.
//

import UIKit

class LYBaseViewController: UIViewController {
    
    let authManager = LYAuthManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func isLoggedIn() -> Bool {
        return authManager.isLoggedIn()
    }
    
    func askUserToLogin() {
        let loginVC = LYLoginViewController(nibName: "LYLoginViewController", bundle: Bundle.main)
        self.present(loginVC, animated: true, completion: nil)
    }
}
