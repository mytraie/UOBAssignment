//
//  UserServiceProtocol.swift
//  UOBAssignment
//
//  Created by Mytraie Chintapatla on 19/10/21.
//  Copyright © 2021 Mytraie Chintapatla. All rights reserved.
//

import Foundation

class UserService: UserServiceProtocol {
    func fetchUsers(completion: @escaping(Result<[Data],UserError>)->Void) {
        Networking.sharedInstance.getUsers(completion: completion)
    }
}

protocol UserServiceProtocol {
    func fetchUsers(completion: @escaping(Result<[Data],UserError>)->Void)
}
