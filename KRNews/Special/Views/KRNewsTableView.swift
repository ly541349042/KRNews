//
//  KRNewsTableView.swift
//  KRNews
//
//  Created by test on 2018/07/09.
//  Copyright © 2018 liyan. All rights reserved.
//

import UIKit

class KRNewsTableView: LYBaseTableView {

    func setupWithViewModel(_ viewModel: KRNewsViewModel) {
        self.dataArray = viewModel.news
        self.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = self.dataArray[indexPath.row] as! KRNewsModel
        var cell = tableView.dequeueReusableCell(withIdentifier: "newsCell")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "newsCell")
        }
        cell?.textLabel?.text = model.title
        cell?.detailTextLabel?.text = model.category
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}
