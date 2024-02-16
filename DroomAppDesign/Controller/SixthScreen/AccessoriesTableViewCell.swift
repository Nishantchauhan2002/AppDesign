//
//  AccessoriesTableViewCell.swift
//  DroomAppDesign
//
//  Created by Nishant Chauhan on 15/02/24.
//

import UIKit

class AccessoriesTableViewCell: UITableViewCell {

    @IBOutlet weak var backView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backView.layer.cornerRadius=12
        backView.backgroundColor=UIColor(hex: 0x002c44)
    }

}
