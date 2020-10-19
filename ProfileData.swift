//
//  ProfileData.swift
//  MEDS App
//
//  Created by Roopak Phatak on 10/19/20.
//  Copyright © 2020 Roopak Phatak. All rights reserved.
//

import UIKit
class ProfileData {
    var name: String
    var email: String
    var phoneNum: String
    init(name: String, email: String, phoneNum: String){
        self.name = name
        self.email = email
        self.phoneNum = phoneNum
    }
    func getPhoneNum() -> String{
        return self.phoneNum
    }
    
}
