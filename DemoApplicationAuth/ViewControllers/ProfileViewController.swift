//
//  ProfileViewController.swift
//  DemoApplicationAuth
//
//  Created by Gaurav Kumar on 13/09/20.
//  Copyright © 2020 Gaurav Kumar. All rights reserved.
//

import UIKit
import GoogleSignIn

class ProfileViewController: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbNameVal: UILabel!
    @IBOutlet weak var lblContact: UILabel!
    @IBOutlet weak var lblContactVal: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblEmailVal: UILabel!
    @IBOutlet weak var btnLogout: UIButton!
    
    //MARK:- View Delegate
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let userData = UserDefaults.standard.value(forKey: "UserData"){
            let user = userData as! String
            let userArr = user.components(separatedBy: "-")
            lbNameVal.text = userArr[0]
            lblContactVal.text = "8675297492"
            lblEmailVal.text = userArr[1]
        }else{
            lbNameVal.text = "Dummy User"
            lblContactVal.text = "7657XXX891"
            lblEmailVal.text = "sample@gmail.com"
        }

    }
    
    //MARK:- Button Action
    @IBAction func btnLogoutClicked(_ sender: Any) {
        GIDSignIn.sharedInstance()?.signOut()
        self.navigationController?.popViewController(animated: true)
    }
    

}
