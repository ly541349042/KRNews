//
//  LYBaseTabViewController.swift
//  KRNews
//
//  Created by test on 2018/07/09.
//  Copyright © 2018 liyan. All rights reserved.
//

import UIKit

class LYBaseTabViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addChildVC(_ vc: UIViewController, title: String, image: UIImage, selectedImage: UIImage) {
        vc.tabBarItem.image = image
        vc.tabBarItem.selectedImage = selectedImage
        vc.tabBarItem.title = title
        let navi = LYBaseNaviViewController(rootViewController: vc)
        self.addChildViewController(navi)
    }
    
    func moveToTab(_ index: Int) {
        if self.tabBarController(self, shouldSelect: self.viewControllers![index]) {
            self.selectedIndex = index
            self.tabBarController(self, didSelect: self.viewControllers![index])
        }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        //
    }
}
