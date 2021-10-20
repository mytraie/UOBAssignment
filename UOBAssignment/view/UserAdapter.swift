//
//  UserAdapter.swift
//  UOBAssignment
//
//  Created by Mytraie Chintapatla on 19/10/21.
//  Copyright © 2021 Mytraie Chintapatla. All rights reserved.
//

import UIKit

protocol UserAdapterDelegate: class {
    func didTap(_ item: Data)
}

class UserAdapter: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    let identifier = "UserInfoCell"
    var users: [Data]?
    weak var delegate: UserAdapterDelegate?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: CustomCell = tableView.dequeueReusableCell(withIdentifier: identifier) as! CustomCell
        let user = users?[indexPath.row]
        cell.userFirstName.text = user?.first_name
        cell.userDP.loadImage(at: URL(string: user!.avatar)!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = users?[indexPath.row] else { return }
        delegate?.didTap(item)
    }
    
}
