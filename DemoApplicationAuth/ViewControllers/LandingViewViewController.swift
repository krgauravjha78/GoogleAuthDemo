//
//  LandingViewViewController.swift
//  DemoApplicationAuth
//
//  Created by Gaurav Kumar on 13/09/20.
//  Copyright © 2020 Gaurav Kumar. All rights reserved.
//

import UIKit
import GoogleSignIn

class LandingViewViewController: UIViewController, GIDSignInDelegate {
    
    //MARK:- Outlets
    @IBOutlet weak var navigateWithoutSignIn: UIButton!

    //MARK:- View Delegate
    override func viewDidLoad() {
        super.viewDidLoad()
        navigateWithoutSignIn.layer.borderWidth = 1
        navigateWithoutSignIn.layer.borderColor = UIColor.white.cgColor
        let signInBtn = GIDSignInButton(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
        signInBtn.center = view.center
        self.view.addSubview(signInBtn)
        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self
    }
    
    //MARK:- Class Functions
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
          if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
            print("The user has not signed in before or they have since signed out.")
          } else {
            print("\(error.localizedDescription)")
          }
          return
        }
        UserDefaults.standard.set(true, forKey: "isLoggedIn")
        let userName = user.profile.name!
        let email = user.profile.email!
        UserDefaults.standard.set("\(userName)-\(email)", forKey: "UserData")
        navigateToTabBar()
        
    }
    
    func navigateToTabBar() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let tabBarViewController = storyBoard.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
        self.navigationController?.pushViewController(tabBarViewController, animated: true)
    }

    //MARK:- Button Action
    @IBAction func btnNavigateClicked(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
        UserDefaults.standard.removeObject(forKey: "UserData")
        navigateToTabBar()
    }

}
