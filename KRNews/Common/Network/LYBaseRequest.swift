//
//  LYBaseRequest.swift
//  KRNews
//
//  Created by test on 2018/07/09.
//  Copyright © 2018 liyan. All rights reserved.
//

import UIKit

class LYBaseRequest: NSObject {

    static func requestRegister(_ params:[String: Any],
                                finishedBlock: @escaping(_ result: Bool) -> ()) {
        print("\(params)")
        LYNetManager.shared.requestPostData(
            component: kUrlEnjobRegister,
            params: params,
            successBlock: { (string) in
                print("reqe reg string \(string)")
        }) { (error) in
            //
        }
    }
    
    static func requestLogin(email: String,
                             password: String,
                             finishedBlock: @escaping(_ result: Bool) -> ()) {
        let param = ["email": email, "password": password]
        LYNetManager.shared.requestPostData(
            component: kUrlEnjobLogin,
            params: param,
            successBlock: { (string) in
                if let dic = string.convertToDic() as? [String: String] {
                    let accessToken: String = dic["accessToken"]!
                    let refreshToken: String = dic["refreshToken"]!
                    let expiresTime: String = dic["expiresTime"]!
                    LYAuthManager.shared.accessToken = "Bearer \(accessToken)"
                    LYAuthManager.shared.refreshToken = refreshToken
                    LYAuthManager.shared.expiresTime = expiresTime
                    finishedBlock(true)
                }
        }) { (error) in
            //
            finishedBlock(false)
        }
    }
    
    static func requestUserInfo(_ finishedBlock: @escaping(_ result: UserInfoModel) -> ()) {
        LYNetManager.shared.requestPostData(
            component: kUrlEnjobGetUserInfo,
            successBlock: { (jsonStringResponse) in
                
                if let model = UserInfoModel.deserialize(from: jsonStringResponse) {
                    finishedBlock(model)
                }
        }) { (error) in
            //
            
        }
    }
}
