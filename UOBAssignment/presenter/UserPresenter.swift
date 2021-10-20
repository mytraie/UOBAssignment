//
//  UserPresenter.swift
//  UOBAssignment
//
//  Created by Mytraie Chintapatla on 19/10/21.
//  Copyright © 2021 Mytraie Chintapatla. All rights reserved.
//

import UIKit

protocol UserView: NSObjectProtocol {
    func showToast(message: String, duration: Double)
    func startLoading()
    func finishLoading()
    func setUser(users: [Data])
    func setEmptyUsers()
}

class UserPresenter {
    private let userService: Networking
    weak private var userView: UserView?
    
    init() {
        self.userService = Networking.init()
    }
    
    func attachView(view: UserView) {
        userView = view
    }
    
    func detachView() {
        userView = nil
    }
    
    func getUsers() {
        userView?.startLoading()
        Networking.sharedInstance.getUsers{[weak self] result in
            DispatchQueue.main.async{
                switch result {
                case .failure(let error):
                    print(error)
                    
                    self?.userView?.finishLoading()
                case .success(let usersRes):
                    self?.userView?.finishLoading()
                    if (usersRes.count == 0){
                        self?.userView?.setEmptyUsers()
                    } else {
                        self?.userView?.setUser(users: usersRes)
                    }
                }
            }
        }
    }
}
