//
//  UserInfoModel.swift
//  KRNews
//
//  Created by test on 2018/07/09.
//  Copyright © 2018 liyan. All rights reserved.
//

import UIKit

enum Gender: String {
    case Male, Female
}

enum LoginTag: String {
    case App, WeChat, QQ, Gmail, FaceBook
}

class UserRegInfoModel: LYBaseModel {

    var email = ""
    var password = ""
    var username = ""
    var gender: String = Gender.Male.rawValue //  male/female
    var dateOfBirth = "19700101"    //  19901231
    var tel = "0"    //  09012341234
    var loginTag: String = LoginTag.App.rawValue   //  App/WeChat/QQ/Gmail/FaceBook
}

class UserInfoModel: LYBaseModel {

    var id = 0
    var email = ""
    var nickName = ""
    var gender: String = Gender.Male.rawValue //  male/female
    var dateOfBirth = "19700101"    //  19901231
    var tel = "0"    //  09012341234
    var loginTag: String = LoginTag.App.rawValue   //  App/WeChat/QQ/Gmail/FaceBook
}
