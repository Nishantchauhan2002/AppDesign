//
//  LoanAndInsuranceTableViewCell.swift
//  DroomAppDesign
//
//  Created by Nishant Chauhan on 13/02/24.
//

import UIKit

class LoanAndInsuranceTableViewCell: UITableViewCell {
    let numberOfCell=2
    @IBOutlet weak var backViewInLoan: UIView!
    @IBOutlet weak var stackviewLoan: UIStackView!
    @IBOutlet weak var loanCollectionView: UICollectionView!
    @IBOutlet weak var loanPolicyView: UIView!
    @IBOutlet weak var offerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        loanCollectionView.delegate=self
        loanCollectionView.dataSource=self
        
        backViewInLoan.backgroundColor=UIColor(hex: 0x002c44)
        loanPolicyView.layer.cornerRadius=15
        offerView.layer.cornerRadius=15
        loanCollectionView.layer.cornerRadius=15
        loanCollectionView.register(UINib(nibName: "LoanCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "loanCell")
        
    }
}
extension LoanAndInsuranceTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("In the collection")
        return 4
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:LoanCollectionViewCell=loanCollectionView.dequeueReusableCell(withReuseIdentifier: "loanCell", for: indexPath) as! LoanCollectionViewCell
        cell.loanCollectionLabel.text="4 Wheel Insurance"
        cell.layer.borderWidth=0.5
        cell.layer.borderColor=UIColor.lightGray.cgColor
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth=loanCollectionView.frame.width
        let cellWidth=(collectionViewWidth - CGFloat(numberOfCell-1))/CGFloat(numberOfCell)
        let cellHeight=CGFloat(90)
        return CGSize(width: cellWidth, height: cellHeight)
                      
    }
    
    
}
