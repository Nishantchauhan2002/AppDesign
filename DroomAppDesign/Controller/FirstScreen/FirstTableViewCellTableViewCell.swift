//
//  FirstTableViewCellTableViewCell.swift
//  DroomAppDesign
//
//  Created by Nishant Chauhan on 12/02/24.
//

import UIKit

class FirstTableViewCellTableViewCell: UITableViewCell {

    @IBOutlet weak var mainImage: UIImageView!
    
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var createRequirementbutton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        searchView.layer.cornerRadius=50.0
        searchTextField.layer.cornerRadius=50.0
        searchButton.layer.cornerRadius=50.0
        
    }

    
}
