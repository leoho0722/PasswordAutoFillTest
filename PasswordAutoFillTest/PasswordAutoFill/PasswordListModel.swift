//
//  PasswordListModel.swift
//  PasswordAutoFillTest
//
//  Created by Leo Ho on 2022/7/5.
//

import Foundation

struct PasswordListModel: Identifiable {
    
    var id = UUID().uuidString
    
    var title: String
    
    var account: String
    
    var password: String
}
