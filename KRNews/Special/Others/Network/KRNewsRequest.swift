//
//  KRNewsRequest.swift
//  KRNews
//
//  Created by test on 2018/07/09.
//  Copyright © 2018 liyan. All rights reserved.
//

import UIKit

class KRNewsRequest: NSObject {

    
    static func requestNewsList(_ params:[String: Any]? = nil,
                                finishedBlock: @escaping(_ result: KRNewsViewModel) -> ()) {
        LYNetManager.shared.requestPostData(
            component: kUrlEnjobNewsList,
            params: params,
            successBlock: { (jsonStringResponse) in
                if let dataModel = KRNewsViewModel.deserialize(from: jsonStringResponse) {
                    finishedBlock(dataModel)
                } else {
                    let model = KRNewsViewModel()
                    finishedBlock(model)
                }
        }) { (error) in
            let model = KRNewsViewModel()
            finishedBlock(model)
        }
    }
    
    
    
    static func requestActivities(_ params: [String: Any]? = nil,
                                  finishedBlock: @escaping(_ result: KRActivityViewModel) -> ()) {
        LYNetManager.shared.requestPostData(
            component: kUrlEnjobActivityList,
            params: params,
            successBlock: { (jsonStringResponse) in
                if let dataModel = KRActivityViewModel.deserialize(from: jsonStringResponse) {
                    finishedBlock(dataModel)
                } else {
                    let model = KRActivityViewModel()
                    finishedBlock(model)
                }
        }) { (error) in
            let model = KRActivityViewModel()
            finishedBlock(model)
        }
    }
    
    static func requestMyActivities(_ finishedBlock: @escaping(_ result: KRActivityViewModel) -> ()) {
        LYNetManager.shared.requestPostData(
            component: kUrlEnjobMyActivity,
            successBlock: { (jsonStringResponse) in
                if let dataModel = KRActivityViewModel.deserialize(from: jsonStringResponse) {
                    finishedBlock(dataModel)
                } else {
                    let model = KRActivityViewModel()
                    finishedBlock(model)
                }
        }) { (error) in
            let model = KRActivityViewModel()
            finishedBlock(model)
        }
    }
}
