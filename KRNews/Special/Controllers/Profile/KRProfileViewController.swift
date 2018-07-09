//
//  KRProfileViewController.swift
//  KRNews
//
//  Created by test on 2018/07/09.
//  Copyright © 2018 liyan. All rights reserved.
//

import UIKit

class KRProfileViewController: LYBaseViewController {

    lazy var profileTableView: KRProfileTableView = {
        let view = KRProfileTableView(frame: self.view.frame, style: .plain)
        view.lyTableViewDelegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "profile"
        
        self.view.addSubview(self.profileTableView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.profileTableView.setup()
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

extension KRProfileViewController: LYTableViewDelegate {
    func tableView(_ tableView: UITableView, didClick index: IndexPath) {
        if !self.isLoggedIn() {
            self.askUserToLogin()
            return
        }
        if index.row == 0 {
            let alc = UIAlertController(title: LYAuthManager.shared.currentUser.nickName, message: LYAuthManager.shared.currentUser.gender, preferredStyle: .alert)
            alc.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
            self.present(alc, animated: true, completion: nil)
        }
        if index.row == 2 {
            KRNewsRequest.requestMyActivities { (viewModel) in
                if viewModel.activities.count == 0,
                    let tabVC = self.tabBarController as? KRTabViewController {
                    let alc = UIAlertController(title: "no activities!", message: "go and pick one!", preferredStyle: .alert)
                    alc.addAction(UIAlertAction(title: "okay", style: .default, handler: { (action) in
                        tabVC.moveToTab(1)
                    }))
                    self.present(alc, animated: true, completion: nil)
                } else {
                    let vc = KRActivityViewController()
                    vc.navigationItem.title = "my activity"
                    vc.activityTableView.setupWithViewModel(viewModel)
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
    }
}
