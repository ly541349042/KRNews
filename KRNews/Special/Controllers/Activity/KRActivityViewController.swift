//
//  KRActivityViewController.swift
//  KRNews
//
//  Created by test on 2018/07/09.
//  Copyright © 2018 liyan. All rights reserved.
//

import UIKit

class KRActivityViewController: LYBaseViewController {

    lazy var activityTableView: KRActivityTableView = {
        let view = KRActivityTableView(frame: self.view.frame, style: .plain)
        view.lyTableViewDelegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "what event?"
        
        self.requestActivities()
    }

    func requestActivities() {
        KRNewsRequest.requestActivities { (model) in
            self.activityTableView.setupWithViewModel(model)
        }
        self.view.addSubview(self.activityTableView)
    }

}

extension KRActivityViewController: LYTableViewDelegate {
    func tableView(_ tableView: UITableView, didClick index: IndexPath) {
        print("click")
    }
}
