//
//  CustomCell.swift
//  UOBAssignment
//
//  Created by Mytraie Chintapatla on 19/10/21.
//  Copyright © 2021 Mytraie Chintapatla. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet weak var userDP: UIImageView!
    @IBOutlet weak var userFirstName: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        userDP.image = nil
        userDP.cancelImageLoad()
    }
    
}



