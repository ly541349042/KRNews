//
//  LYNetManager.swift
//  KRNews
//
//  Created by test on 2018/07/09.
//  Copyright © 2018 liyan. All rights reserved.
//

import UIKit
import Alamofire

class LYNetManager: NSObject {

    static let shared = LYNetManager(kUrlEnjobBasicApi)
    let baseUrl: String
    private init(_ baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    var headers: HTTPHeaders {
        get {
            if LYAuthManager.shared.isLoggedIn() {
                return ["Authentication" : LYAuthManager.shared.accessToken,
                        "accept" : "application/json;charset=UTF-8"]
            }
            return [:]
        }
    }
    
    public func requestGetData(component: String,
                               params: [String: Any]? = nil,
                               successBlock: @escaping(_ result: String) ->(),
                               failBlock: @escaping(_ error: Error) -> ()) {
        requestData(.get, component: component, params: params, successBlock: successBlock, failBlock: failBlock)
    }
    
    public func requestPostData(component: String,
                                params: [String: Any]? = nil,
                                successBlock: @escaping(_ result: String) ->(),
                                failBlock: @escaping(_ error: Error) -> ()) {
        requestData(.post, component: component, params: params, successBlock: successBlock, failBlock: failBlock)
    }
    
    private func requestData(_ type: HTTPMethod,
                             component: String,
                             params: [String: Any]? = nil,
                             successBlock: @escaping(_ result: String) ->(),
                             failBlock: @escaping(_ error: Error) -> ()) {
        let url = baseUrl + component
        Alamofire.request(url, method: type, parameters: params, encoding: URLEncoding.default, headers: headers).responseString { (jsonString) in
            guard let value = jsonString.result.value else {
                print(jsonString.result.error!)
                failBlock(jsonString.result.error!)
                return
            }
            print(value)
            successBlock(value)
        }
    }
}
