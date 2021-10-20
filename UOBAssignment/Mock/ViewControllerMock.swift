//
//  ViewControllerMock.swift
//  UOBAssignment
//
//  Created by Mytraie Chintapatla on 20/10/21.
//  Copyright © 2021 Mytraie Chintapatla. All rights reserved.
//

import UIKit

class ViewControllerMock: NSObject, UserView {
    
    var testUsers: [Data] = []
    
    func showToast(message: String, duration: Double) {
        
    }
    
    func startLoading() {
        
    }
    
    func finishLoading() {
        
    }
    
    func setUser(users: [Data]) {
        testUsers.append(contentsOf: users)
    }
    
    func users() -> [Data] {
        return testUsers
    }
    
    func setEmptyUsers() {
        
    }
    
}
