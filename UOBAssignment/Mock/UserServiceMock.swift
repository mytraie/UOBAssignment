//
//  UserServiceMock.swift
//  UOBAssignmentTests
//
//  Created by Mytraie Chintapatla on 19/10/21.
//  Copyright © 2021 Mytraie Chintapatla. All rights reserved.
//

import Foundation

class UserServiceMock: UserServiceProtocol {
    
    var dummyUsers: [Data]
    init(users: [Data]) {
        dummyUsers = users
    }
    
    func fetchUsers(completion: @escaping (Result<[Data], UserError>) -> Void) {
        completion(.success(dummyUsers))
    }
}

