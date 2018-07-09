//
//  KRActivityTableView.swift
//  KRNews
//
//  Created by test on 2018/07/09.
//  Copyright © 2018 liyan. All rights reserved.
//

import UIKit

class KRActivityTableView: LYBaseTableView {

    func setupWithViewModel(_ viewModel: KRActivityViewModel) {
        self.dataArray = viewModel.activities
        self.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = self.dataArray[indexPath.row] as! KRActivityModel
        var cell = tableView.dequeueReusableCell(withIdentifier: "activityCell")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "activityCell")
        }
        cell?.textLabel?.text = model.title
        cell?.detailTextLabel?.text = model.address
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}
