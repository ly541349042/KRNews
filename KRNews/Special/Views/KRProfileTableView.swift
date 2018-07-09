//
//  KRProfileTableView.swift
//  KRNews
//
//  Created by test on 2018/07/09.
//  Copyright © 2018 liyan. All rights reserved.
//

import UIKit

class KRProfileTableView: LYBaseTableView {
    
    func setup() {
        self.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        var cell = tableView.dequeueReusableCell(withIdentifier: "profileCell")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "profileCell")
        }
        switch indexPath.row {
        case 0:
            cell?.textLabel?.text = LYAuthManager.shared.isLoggedIn() ? LYAuthManager.shared.currentUser.nickName : "login/register"
        case 1:
            cell?.textLabel?.text = "my news"
        case 2:
            cell?.textLabel?.text = "my activity"
        case 3:
            cell?.textLabel?.text = "about us"
        case 4:
            cell?.textLabel?.text = "more"
        default:
            print("out")
        }

        
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}
