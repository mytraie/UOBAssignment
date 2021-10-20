//
//  Users.swift
//  UOBAssignment
//
//  Created by Mytraie Chintapatla on 19/10/21.
//  Copyright © 2021 Mytraie Chintapatla. All rights reserved.
//

import Foundation

struct Data : Decodable {
    var id: Int
    var email: String
    var first_name: String
    var last_name: String
    var avatar: String
}

struct UsersResponse : Decodable {
    var data: [Data] = []
}
