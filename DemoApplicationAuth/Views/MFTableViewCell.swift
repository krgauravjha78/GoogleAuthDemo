//
//  MFTableViewCell.swift
//  DemoApplicationAuth
//
//  Created by Gaurav Kumar on 13/09/20.
//  Copyright © 2020 Gaurav Kumar. All rights reserved.
//

import UIKit

class MFTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblCompanyName: UILabel!
    @IBOutlet weak var lblInvestedVal: UILabel!
    @IBOutlet weak var lblMarketCap: UILabel!
    @IBOutlet weak var lblROI: UILabel!
    @IBOutlet weak var lblSIPAmount: UILabel!
    
    var cellData: [String:String]?{
        didSet{
            lblCompanyName.text = cellData!["CompanyName"]
            lblROI.text = cellData!["ROI"]
            lblInvestedVal.text = cellData!["InvestedVal"]
            lblSIPAmount.text = cellData!["SIP Amount"]
            lblMarketCap.text = cellData!["MarketCap"]
        }
    }
    
}
