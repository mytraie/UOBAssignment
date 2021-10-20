//
//  UOBAssignmentTests.swift
//  UOBAssignmentTests
//
//  Created by Mytraie Chintapatla on 19/10/21.
//  Copyright © 2021 Mytraie Chintapatla. All rights reserved.
//

import XCTest
@testable import UOBAssignment

class UOBAssignmentTests: XCTestCase {
    
    var presenter: UserPresenter!
    var view: UserView!
    
    override func setUpWithError() throws {
        view = ViewControllerMock()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUsers() throws {
        var dummies = [UOBAssignment.Data]()
        dummies.append(Data(id: 1, email: "test1@email.com", first_name: "abc", last_name: "def", avatar: "https://reqres.in/img/faces/7-image.jpg"))
        dummies.append(Data(id: 2, email: "test2@email.com", first_name: "xyz", last_name: "123", avatar: "https://reqres.in/img/faces/8-image.jpg"))
        presenter = UserPresenter(service: UserServiceMock(users: dummies))
        presenter.attachView(view: view)
        presenter.getUsers()
        XCTAssertNotNil(presenter.view().users())
    }
    
    func testEmptyUsers() throws {
        let users = [UOBAssignment.Data]()
        presenter = UserPresenter(service: UserServiceMock(users: users))
        presenter.attachView(view: view)
        presenter.getUsers()
        XCTAssert(presenter.view().users().count == 0)
    }

    

}
