//
//  ServiceCenterTableViewCell.swift
//  DroomAppDesign
//
//  Created by Nishant Chauhan on 14/02/24.
//

import UIKit

class ServiceCenterTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout,UIScrollViewDelegate{

    @IBOutlet weak var serviceCollectionView: UICollectionView!
    
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var shopNowbutton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        serviceCollectionView.delegate=self
        serviceCollectionView.dataSource=self
        progressView.progress=0.25
        
        serviceCollectionView.register(UINib(nibName: "ServiceCenterCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ServiceCenterCollectionViewCell")
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:ServiceCenterCollectionViewCell=serviceCollectionView.dequeueReusableCell(withReuseIdentifier: "ServiceCenterCollectionViewCell", for: indexPath) as! ServiceCenterCollectionViewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionViewWidth=(serviceCollectionView.frame.width)/2.5
        let collectionViewHeight=(serviceCollectionView.frame.height)/2
        
        return CGSize(width: collectionViewWidth, height: collectionViewHeight-5)
        
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetX = scrollView.contentOffset.x
            let collectionViewWidth = scrollView.frame.width
            let totalContentWidth = scrollView.contentSize.width
            let scrollPercentage = contentOffsetX / (totalContentWidth - collectionViewWidth)
            updateProgressView(with: scrollPercentage)
    }
    func updateProgressView(with percentage: CGFloat) {
      
        let progress = max(0.25, min(1, percentage))
        progressView.setProgress(Float(progress), animated: true)
    }
    
    
}
