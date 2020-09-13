//
//  TabBarViewController.swift
//  DemoApplicationAuth
//
//  Created by Gaurav Kumar on 13/09/20.
//  Copyright © 2020 Gaurav Kumar. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    //MARK:- Outlets
    @IBOutlet weak var tabBarItems: UITabBar!
    
    //MARK:- View Delegate
    override func viewDidLoad() {
        super.viewDidLoad()
        //Check If User is SignedIn
        let isSignIn = UserDefaults.standard.value(forKey: "isLoggedIn") as! Bool
        if !isSignIn{
            self.viewControllers?.remove(at: 1)
        }
        
    }
    
}
