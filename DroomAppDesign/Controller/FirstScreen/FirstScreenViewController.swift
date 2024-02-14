//
//  FirstScreenViewController.swift
//  DroomAppDesign
//
//  Created by Nishant Chauhan on 12/02/24.
//

import UIKit

class FirstScreenViewController: UIViewController , UITableViewDelegate , UITableViewDataSource, changesMadeInTableView {
   var Expanded=false
    @IBOutlet weak var MaintableView: UITableView!
    var cellHeight=630;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        MaintableView.delegate=self
        MaintableView.dataSource=self
        MaintableView.showsVerticalScrollIndicator=false
        MaintableView.register(UINib(nibName: "FirstTableViewCellTableViewCell", bundle: nil), forCellReuseIdentifier: "firstCell")
        MaintableView.register(UINib(nibName: "AutoMobileCenterTableViewCell", bundle: nil), forCellReuseIdentifier: "AutoMobileCenter")
        MaintableView.register(UINib(nibName: "LoanAndInsuranceTableViewCell", bundle: nil), forCellReuseIdentifier: "LoanAndInsuranceTableViewCell")
        MaintableView.register(UINib(nibName: "AutoMobileInspectionTableViewCell", bundle: nil), forCellReuseIdentifier: "AutoMobileInspectionTableViewCell")
        MaintableView.register(UINib(nibName: "ServiceCenterTableViewCell", bundle: nil), forCellReuseIdentifier: "ServiceCenterTableViewCell")
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row==0{
            let cell:FirstTableViewCellTableViewCell=MaintableView.dequeueReusableCell(withIdentifier: "firstCell") as! FirstTableViewCellTableViewCell
            
                return cell
        }else if indexPath.row==1{
            let cell:AutoMobileCenterTableViewCell=MaintableView.dequeueReusableCell(withIdentifier: "AutoMobileCenter") as! AutoMobileCenterTableViewCell
                cell.delegate=self
            return cell
        }else if indexPath.row==2{
            let cell:LoanAndInsuranceTableViewCell=MaintableView.dequeueReusableCell(withIdentifier: "LoanAndInsuranceTableViewCell")as! LoanAndInsuranceTableViewCell
            return cell
        }else if indexPath.row==3{
            let cell:AutoMobileInspectionTableViewCell=MaintableView.dequeueReusableCell(withIdentifier: "AutoMobileInspectionTableViewCell") as! AutoMobileInspectionTableViewCell
            return cell
        }
        else if indexPath.row==4{
            let cell:ServiceCenterTableViewCell=MaintableView.dequeueReusableCell(withIdentifier: "ServiceCenterTableViewCell")as!
            ServiceCenterTableViewCell
            return cell
        }
        return UITableViewCell()
        
        
           
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row==0{
            return 600
        }
        else if indexPath.row==1 {
            return CGFloat(cellHeight)
        }
        else if indexPath.row==2{
            return 440
        }else if indexPath.row==3{
            return 710
        }else if indexPath.row==4{
            return 500
        }
        return 0
    }
    
    func didRowHeightChanged(_ cell: AutoMobileCenterTableViewCell, newheight: CGFloat,isExpanded:Bool) {
        guard let indexPath = MaintableView.indexPath(for: cell) else {
            return
        }
        MaintableView.rowHeight=newheight+20
        cellHeight=Int(CGFloat(MaintableView.rowHeight))
        MaintableView.reloadData()
//        MaintableView.reloadRows(at: [indexPath], with: .automatic)
    }
    func updatedHeight(_ expanded:Bool)->CGFloat{
        if(expanded==false){
            Expanded=true
            return 630
        }else{
//            Expanded=false
            return 700
        }
       
    }

}
