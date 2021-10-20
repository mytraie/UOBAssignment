//
//  UserPresenter.swift
//  UOBAssignment
//
//  Created by Mytraie Chintapatla on 19/10/21.
//  Copyright © 2021 Mytraie Chintapatla. All rights reserved.
//

import UIKit

protocol UserView: NSObjectProtocol{
    func showToast(message: String, duration: Double)
    func startLoading()
    func finishLoading()
    func setUser(users: [Data])
    func setEmptyUsers()
    func users() -> [Data]
}

class UserPresenter {
    private let userService: UserServiceProtocol
    weak private var userView: UserView?
    
    init(service: UserServiceProtocol) {
        self.userService = service
    }
    
    func attachView(view: UserView) {
        userView = view
    }
    
    func detachView() {
        userView = nil
    }
    
    func view() -> UserView {
        return userView!
    }
    
    func getUsers() {
        userView?.startLoading()
        userService.fetchUsers{[weak self] result in
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
