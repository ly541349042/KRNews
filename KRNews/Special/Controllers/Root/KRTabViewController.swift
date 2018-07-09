//
//  KRTabViewController.swift
//  KRNews
//
//  Created by test on 2018/07/09.
//  Copyright © 2018 liyan. All rights reserved.
//

import UIKit

class KRTabViewController: LYBaseTabViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.addChildVC(KRNewsViewController(), title: "news", image: #imageLiteral(resourceName: "news"), selectedImage: #imageLiteral(resourceName: "news_selected"))
        self.addChildVC(KRActivityViewController(), title: "activity", image: #imageLiteral(resourceName: "activity"), selectedImage: #imageLiteral(resourceName: "activity_selected"))
        self.addChildVC(KRMessageViewController(), title: "message", image: #imageLiteral(resourceName: "message"), selectedImage: #imageLiteral(resourceName: "message_selected"))
        self.addChildVC(KRProfileViewController(), title: "profile", image: #imageLiteral(resourceName: "profile"), selectedImage: #imageLiteral(resourceName: "profile_selected"))
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
