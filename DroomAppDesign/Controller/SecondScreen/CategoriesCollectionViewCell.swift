//
//  CategoriesCollectionViewCell.swift
//  DroomAppDesign
//
//  Created by Nishant Chauhan on 13/02/24.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var lableOfCategory: UILabel!
    
    @IBOutlet weak var imageOfCateory: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellView.layer.cornerRadius=10.0
        
        
    }

}
