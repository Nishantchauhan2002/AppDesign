//
//  AutoMobileInspectionTableViewCell.swift
//  DroomAppDesign
//
//  Created by Nishant Chauhan on 14/02/24.
//

import UIKit

class AutoMobileInspectionTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {
   

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var inspectionImage: UIImageView!
    @IBOutlet weak var ServicecollectionView: UICollectionView!
    @IBOutlet weak var stackViewInspection: UIStackView!
    
    
    override func awakeFromNib() {
       
        super.awakeFromNib()
        ServicecollectionView.delegate=self
        ServicecollectionView.dataSource=self
        pageControl.numberOfPages=5
        pageControl.currentPage=0
        
       
        ServicecollectionView.register(UINib(nibName: "ServiceCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ServiceCollectionViewCell")
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:ServiceCollectionViewCell=ServicecollectionView.dequeueReusableCell(withReuseIdentifier: "ServiceCollectionViewCell", for: indexPath) as! ServiceCollectionViewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth=ServicecollectionView.frame.width
        let collectionViewHeight=ServicecollectionView.frame.height
        
        return CGSize(width: collectionViewWidth, height: collectionViewHeight)
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageControl.currentPage=indexPath.row
        
    }
}
