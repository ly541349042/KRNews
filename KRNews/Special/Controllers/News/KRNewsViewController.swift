//
//  KRNewsViewController.swift
//  KRNews
//
//  Created by test on 2018/07/09.
//  Copyright © 2018 liyan. All rights reserved.
//

import UIKit

class KRNewsViewController: LYBaseViewController {
    
    lazy var newsTableView: KRNewsTableView = {
        let view = KRNewsTableView(frame: self.view.frame, style: .plain)
        view.lyTableViewDelegate = self
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "what's new"
        
        self.requestNews()
    }
    
    func requestNews() {
        KRNewsRequest.requestNewsList { (model) in
            self.newsTableView.setupWithViewModel(model)
        }
        self.view.addSubview(self.newsTableView)
    }
}

extension KRNewsViewController: LYTableViewDelegate {
    func tableView(_ tableView: UITableView, didClick index: IndexPath) {
        print("click!")
    }
}
