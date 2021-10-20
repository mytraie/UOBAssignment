//
//  ViewController.swift
//  UOBAssignment
//
//  Created by Mytraie Chintapatla on 19/10/21.
//  Copyright © 2021 Mytraie Chintapatla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var userTableView: UITableView!
    
    let adapter = UserAdapter()
    let presenter = UserPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(view: self)
        adapter.delegate = self
        userTableView.delegate = adapter.self
        userTableView.dataSource = adapter
        userTableView.showsHorizontalScrollIndicator = false
        userTableView.showsVerticalScrollIndicator = true
        userTableView.translatesAutoresizingMaskIntoConstraints = false
        userTableView.separatorStyle = .singleLine
        userTableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        userTableView.rowHeight = UITableView.automaticDimension
        userTableView.estimatedRowHeight = 100
        userTableView.backgroundColor = .white
        
        presenter.getUsers()
    }
    
    
}

extension ViewController: UserAdapterDelegate {
    func didTap(_ item: Data) {
        showToast(message: item.first_name)
    }
}

extension ViewController: UserView {
    func showToast(message: String, duration: Double = 1) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = .black
        alert.view.alpha = 0.6
        alert.view.layer.cornerRadius = 15
        
        self.present(alert, animated: false)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration) {
            alert.dismiss(animated: true)
        }
    }
    
    func startLoading() {
        userTableView.isHidden = true
    }
    
    func finishLoading() {
        userTableView.isHidden = false
    }
    
    func setUser(users: [Data]) {
        self.adapter.users = users
        self.userTableView.isHidden = false
        self.userTableView.reloadData()
    }
    
    func setEmptyUsers() {
        userTableView.isHidden = true
    }
    
    
    
}

