//
//  LYBaseTableView.swift
//  KRNews
//
//  Created by test on 2018/07/09.
//  Copyright © 2018 liyan. All rights reserved.
//

import UIKit

protocol LYTableViewDelegate: NSObjectProtocol {
    func tableView(_ tableView: UITableView, didClick index: IndexPath)
}

class LYBaseTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
//    var baseTableViewModel: LYBaseViewModel = LYBaseViewModel()
    
    var dataArray: [Any] = []

    weak var lyTableViewDelegate: LYTableViewDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.dataSource = self
        self.delegate = self
    }
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.delegate = self
        self.dataSource = self
    }
    
//    func setupWithViewModel(_ viewModel: LYBaseViewModel) {
//        print("rewrite this to load data")
//    }
    
    deinit {
        self.delegate = nil
        self.dataSource = nil
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        lyTableViewDelegate?.tableView(tableView, didClick: indexPath)
    }
}
