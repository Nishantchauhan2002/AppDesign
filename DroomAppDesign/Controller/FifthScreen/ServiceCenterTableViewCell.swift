//
//  ServiceCenterTableViewCell.swift
//  DroomAppDesign
//
//  Created by Nishant Chauhan on 14/02/24.
//

import UIKit

class ServiceCenterTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var serviceCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        serviceCollectionView.delegate=self
        serviceCollectionView.dataSource=self
        
        serviceCollectionView.register(UINib(nibName: "ServiceCenterCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ServiceCenterCollectionViewCell")
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:ServiceCenterCollectionViewCell=serviceCollectionView.dequeueReusableCell(withReuseIdentifier: "ServiceCenterCollectionViewCell", for: indexPath) as! ServiceCenterCollectionViewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionViewWidth=serviceCollectionView.frame.width
        let collectionViewHeight=serviceCollectionView.frame.height
        
        return CGSize(width: collectionViewWidth/2, height: collectionViewHeight/2)
        
    }
    
    
}
