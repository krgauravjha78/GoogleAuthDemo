//
//  InvestedMFViewController.swift
//  DemoApplicationAuth
//
//  Created by Gaurav Kumar on 13/09/20.
//  Copyright © 2020 Gaurav Kumar. All rights reserved.
//

import UIKit

class InvestedMFViewController: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var tblMfListData: UITableView!
    @IBOutlet weak var lblHeader: UILabel!
    
    //MARK:- Variable Declaration
    var data = [[String:String]]()

    //MARK:- View Delegate
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblMfListData.register(UINib(nibName: "MFTableViewCell", bundle: nil), forCellReuseIdentifier: "mfTableViewCell")
        
        data = [["CompanyName":"Axis Mutual Fund","InvestedVal":"8867","MarketCap":"54362 CR","ROI":"13.9","SIP Amount":"11000"],["CompanyName":"ICICI Mutual Fund","InvestedVal":"3825","MarketCap":"899 CR","ROI":"12.4","SIP Amount":"6000"],["CompanyName":"SBI Mutual Fund","InvestedVal":"43724","MarketCap":"6554 CR","ROI":"11.9","SIP Amount":"9003"]]

    }
    
    //MARK:- Class Functions
    func navigateToPdfScreen(selectedIndex : Int) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let pdfViewController = storyBoard.instantiateViewController(withIdentifier: "PDFViewController") as! PDFViewController
        pdfViewController.selectedIndex = selectedIndex
        pdfViewController.selectedData = data[selectedIndex]
        self.navigationController?.pushViewController(pdfViewController, animated: true)
    }

}

//MARK:- TableView Extension
extension InvestedMFViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mfTableViewCell", for: indexPath as IndexPath) as! MFTableViewCell
        
       cell.cellData = data[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigateToPdfScreen(selectedIndex: indexPath.row)
    }
    
    
}
