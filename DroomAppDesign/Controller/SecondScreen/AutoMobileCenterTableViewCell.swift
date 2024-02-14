import UIKit

var isExpanded=false

protocol changesMadeInTableView{
    func didRowHeightChanged(_ cell:AutoMobileCenterTableViewCell,newheight:CGFloat,isExpanded:Bool)
}

class AutoMobileCenterTableViewCell: UITableViewCell {
    let numberofCellsInRow=4
    
    var delegate:changesMadeInTableView?
    
    let cellheight=76
    let cellwidth=90
    
  
    @IBOutlet weak var lastLabelHeight: NSLayoutConstraint!
    @IBOutlet weak var imageHeight: NSLayoutConstraint!
    @IBOutlet weak var BuySellStackViewHeight: NSLayoutConstraint!
    @IBOutlet weak var backViewheightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var buySellStackView: UIStackView!
    @IBOutlet weak var buySellView: UIView!
    @IBOutlet weak var offerView: UIView!
    
    @IBOutlet weak var sellButtonView: UIView!
    @IBOutlet weak var buyButtonView: UIView!
    
    
    var categoriesImages: [String]=["Bike", "Car", "EV", "Scooter", "Bike", "Car", "EV", "Four+", "Bike", "Car", "EV", "Scooter"]
    var catogriesLabel:[String]=["Bike","Car","EV","Scooter","Bicycle","Plain","Taxi","4+ more","Car","Car","Car","4-Less"]
    
    var visibleImages=8;
    
    
    @IBOutlet weak var BackView: UIView!
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        BackView.backgroundColor = UIColor(hex: 0x002c44)
        BackView.layer.cornerRadius=5
        
        categoriesCollectionView.delegate=self
        categoriesCollectionView.dataSource=self
//        backViewheightConstraint.constant=610
        
        collectionViewHeightConstraint.constant=CGFloat((visibleImages*cellheight)/4)+28;
        categoriesCollectionView.backgroundColor=UIColor(hex: 0x002c44)
        categoriesCollectionView.register(UINib(nibName: "CategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "categoriesCollectionViewCell")
        
        //for giving the border to the sell and buy label
        configureTheButton();
        
    }

}
extension UIColor {
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((hex >> 16) & 0xFF) / 255.0,
            green: CGFloat((hex >> 8) & 0xFF) / 255.0,
            blue: CGFloat(hex & 0xFF) / 255.0,
            alpha: alpha
        )
    }
}
extension AutoMobileCenterTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return visibleImages;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CategoriesCollectionViewCell=categoriesCollectionView.dequeueReusableCell(withReuseIdentifier: "categoriesCollectionViewCell", for: indexPath) as! CategoriesCollectionViewCell
        
        cell.imageOfCateory.image=UIImage(named: categoriesImages[indexPath.row])
        cell.lableOfCategory.text=catogriesLabel[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.item == visibleImages-1{
            if(visibleImages==8){
                print("expanding the view ")
                let viewHeight=collectionViewHeightConstraint.constant+imageHeight.constant+BuySellStackViewHeight.constant+lastLabelHeight.constant
                print(viewHeight)
                delegate?.didRowHeightChanged(self, newheight: viewHeight+120,isExpanded:true)
                loadMoreCategories()
            }else{
                print("wrapping the view")
                let viewHeight=collectionViewHeightConstraint.constant+imageHeight.constant+BuySellStackViewHeight.constant+lastLabelHeight.constant
                delegate?.didRowHeightChanged(self, newheight: viewHeight-20,isExpanded: false)
                loadMoreCategories()
            }
            
        }
    }
    
    
    func loadMoreCategories(){
        if(isExpanded==false){
            print(isExpanded)
            print("You have called a load more images funtion and you are in the isExpanded false")
            visibleImages=catogriesLabel.count
            print(collectionViewHeightConstraint.constant)
//            let height=((visibleImages*cellheight)/4)+28
            let numberOfRows = ceil(Double(visibleImages) / Double(numberofCellsInRow))
            let collectionViewHeight = CGFloat(numberOfRows) * CGFloat(cellheight)+30;            collectionViewHeightConstraint.constant=CGFloat(collectionViewHeight)
            print(collectionViewHeightConstraint.constant)
            isExpanded=true
            categoriesCollectionView.reloadData()
            UIView.animate(withDuration: 0.5) {
                    self.categoriesCollectionView.layoutIfNeeded()
                }
        }else{
            print(isExpanded)
//            backViewheightConstraint.constant=610

            print("You have called a load more images funtion and you are in the isExpanded true")
            visibleImages=8
//            let height=(visibleImages*cellheight)/4+28
            let numberOfRows = ceil(Double(visibleImages) / Double(numberofCellsInRow))
            let collectionViewHeight = CGFloat(numberOfRows) * CGFloat(cellheight)+28

            collectionViewHeightConstraint.constant=CGFloat(collectionViewHeight)

            categoriesCollectionView.reloadData()
            isExpanded=false
            UIView.animate(withDuration: 0.5) {
                    self.categoriesCollectionView.layoutIfNeeded()
                }
        }
        
    }
    func configureTheButton(){
        
        buySellView.layer.cornerRadius=10
        offerView.layer.cornerRadius=12
//        offerView.isHidden=true
        //for the sellbutton
        sellButtonView.layer.borderWidth=CGFloat(1)
        sellButtonView.layer.borderColor = UIColor(
            red: 180/255.0,
            green: 220/255.0,
            blue: 242/255.0,
            alpha: 1.0
        ).cgColor
        sellButtonView.layer.cornerRadius = sellButtonView.frame.width / 2
        sellButtonView.layer.masksToBounds = true
        
        //for the buy button
        //for the sellbutton
        buyButtonView.layer.borderWidth=CGFloat(1)
        buyButtonView.layer.borderColor = UIColor(
            red: 180/255.0,
            green: 220/255.0,
            blue: 242/255.0,
            alpha: 1.0
        ).cgColor
        buyButtonView.layer.cornerRadius = buyButtonView.frame.width / 2
        buyButtonView.layer.masksToBounds = true
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth=collectionView.frame.width
        let cellWidth=(collectionViewWidth - CGFloat(numberofCellsInRow-1))/CGFloat(numberofCellsInRow)-10
        let cellheight=CGFloat(76)
        return CGSize(width: cellWidth, height: cellheight)
    }
}

