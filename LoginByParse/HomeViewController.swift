//
//  HomeViewController.swift
//  ParseDemo
//
//  Created by Rumiya Murtazina on 7/31/15.
//  Copyright (c) 2015 abearablecode. All rights reserved.
//

import UIKit
import Parse

class HomeViewController: UIViewController {
    @IBOutlet weak var userNameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 顯示目前訪客的使用者名稱
        if let pUserName = PFUser.currentUser()?["username"] as? String {
            self.userNameLabel.text = "@" + pUserName
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //為了能夠關閉"重設密碼"畫面，我們需要定義用來解除的 Segue
    @IBAction func unwindToLogInScreen(segue:UIStoryboardSegue) {
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        //無實體化表示尚未登入，導引至登入頁面
        if(PFUser.currentUser() == nil){
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                let viewController : UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Login")
                self.presentViewController(viewController, animated: true, completion: nil)
            })
        }
    }
    
    @IBAction func logOutAction(sender: AnyObject){
        
        // 傳送使用者登出的要求
        PFUser.logOut()
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Login")
            self.presentViewController(viewController, animated: true, completion: nil)
        })
        
    }

}
