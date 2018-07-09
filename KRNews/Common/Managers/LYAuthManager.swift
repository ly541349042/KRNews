//
//  LYAuthManager.swift
//  KRNews
//
//  Created by test on 2018/07/09.
//  Copyright © 2018 liyan. All rights reserved.
//

import UIKit

class LYAuthManager: NSObject {

    static let shared = LYAuthManager()
    override init() {
        super.init()
    }
    
    var accessToken = ""
    var refreshToken = ""
    var expiresTime = ""
    
    var currentUser = UserInfoModel()
    
    public func isLoggedIn() -> Bool {
        if self.accessToken != "" {
            return true
        }
        return false
    }
}
