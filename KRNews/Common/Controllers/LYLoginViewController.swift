//
//  LYLoginViewController.swift
//  KRNews
//
//  Created by test on 2018/07/09.
//  Copyright © 2018 liyan. All rights reserved.
//

import UIKit

class LYLoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickLogin(_ sender: Any) {
        
        guard let email = emailTextField.text else { return }
        guard let pwd = passwordTextField.text else { return }
        
        LYBaseRequest.requestLogin(email: email, password: pwd) { (result) in
            if result {
                LYBaseRequest.requestUserInfo({ (model) in
                    LYAuthManager.shared.currentUser = model
                    self.dismiss(animated: true, completion: nil)
                })
            }
        }
    }
    
    @IBAction func clickRegister(_ sender: Any) {
        
        guard let email = emailTextField.text else { return }
        guard let pwd = passwordTextField.text else { return }
        
        let userInfo = UserRegInfoModel()
        userInfo.email = email
        userInfo.password = pwd
        userInfo.username = email
        userInfo.loginTag = LoginTag.App.rawValue
        LYBaseRequest.requestRegister(userInfo.toJSON()!) { (result) in
            if result {
                print("reg success")
            } else {
                print("error")
            }
        }
    }
    
    @IBAction func clickWeChatLogin(_ sender: Any) {
    }
    
    @IBAction func clickQqLogin(_ sender: Any) {
    }
    
    @IBAction func clickGmailLogin(_ sender: Any) {
    }
    
    @IBAction func clickFbLogin(_ sender: Any) {
    }
    
    @IBAction func clickCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
