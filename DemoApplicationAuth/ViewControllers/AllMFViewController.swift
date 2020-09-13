//
//  AllMFViewController.swift
//  DemoApplicationAuth
//
//  Created by Gaurav Kumar on 13/09/20.
//  Copyright © 2020 Gaurav Kumar. All rights reserved.
//

import UIKit

class AllMFViewController: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var tblMfListData: UITableView!
    @IBOutlet weak var lblHeader: UILabel!
    
    //MARK:- Variable Declaration
    var data = [[String:String]]()
    
    //MARK:- View Delegate
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblMfListData.register(UINib(nibName: "MFTableViewCell", bundle: nil), forCellReuseIdentifier: "mfTableViewCell")
        data = [
            ["CompanyName":"Axis Mutual Fund","InvestedVal":"3825","MarketCap":"899 CR","ROI":"13.9","SIP Amount":"6000"],
            ["CompanyName":"ICICI Mutual Fund","InvestedVal":"4532","MarketCap":"97738 CR","ROI":"12.1","SIP Amount":"5000"],
            ["CompanyName":"SBI Mutual Fund","InvestedVal":"1123","MarketCap":"3484 CR","ROI":"13.2","SIP Amount":"4000"],
            ["CompanyName":"IDBI Mutual Fund","InvestedVal":"524","MarketCap":"1452 CR","ROI":"13.6","SIP Amount":"6000"],
            ["CompanyName":"HDFC Mutual Fund","InvestedVal":"9829","MarketCap":"6254 CR","ROI":"11.9","SIP Amount":"5000"],
            ["CompanyName":"Parekh Mutual Fund","InvestedVal":"5142","MarketCap":"14235 CR","ROI":"12.9","SIP Amount":"6000"],
            ["CompanyName":"Nippon Mutual Fund","InvestedVal":"2321","MarketCap":"934 CR","ROI":"11.6","SIP Amount":"4000"],
            ["CompanyName":"LIC Mutual Fund","InvestedVal":"1223","MarketCap":"151 CR","ROI":"12.8","SIP Amount":"6000"],
            ["CompanyName":"Kravy Mutual Fund","InvestedVal":"1233","MarketCap":"2843 CR","ROI":"11.2","SIP Amount":"6000"],
            ["CompanyName":"Multicap Mutual Fund","InvestedVal":"23344","MarketCap":"2634 CR","ROI":"13.2","SIP Amount":"5000"],
            ["CompanyName":"SmallCap Mutual Fund","InvestedVal":"1342","MarketCap":"34795 CR","ROI":"12.4","SIP Amount":"4000"]
        ]
    }
    
}

//MARK:- TableView Extension
extension AllMFViewController : UITableViewDelegate, UITableViewDataSource{
    
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
    
    
}
