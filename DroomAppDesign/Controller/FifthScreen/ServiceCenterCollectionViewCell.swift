//
//  ServiceCenterCollectionViewCell.swift
//  DroomAppDesign
//
//  Created by Nishant Chauhan on 14/02/24.
//

import UIKit

class ServiceCenterCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var midLabel: UILabel!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var imgLabel: UIImageView!
    
    @IBOutlet weak var cellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellView.layer.cornerRadius=12.0
    }

}
