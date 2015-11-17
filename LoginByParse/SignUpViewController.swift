//
//  SignUpViewController.swift
//  ParseDemo
//
//  Created by Rumiya Murtazina on 7/30/15.
//  Copyright (c) 2015 abearablecode. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signUpAction(sender: AnyObject) {
        
        let username = self.usernameField.text
        let password = self.passwordField.text
        let email = self.emailField.text
        let finalEmail = email!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        // 驗證文字欄位
        if let username = username where username.characters.count < 5 {
            showAlert(title: "無效", message: "使用者名稱需大於5個字元", buttonText: "OK")
            
        } else if let password = password where password.characters.count < 8 {
           showAlert(title: "無效", message: "密碼需大於8個字元", buttonText: "OK")
            
        } else if let email = email where email.characters.count < 8 {
            showAlert(title: "無效", message: "請輸入有效的mail", buttonText: "OK")
            
        } else {
            // 顯示旋轉圖示，代表工作正在進行中
            startProgress(self.view, text: "註冊中，請稍後...")
            
            let newUser = PFUser()
            
            newUser.username = username
            newUser.password = password
            newUser.email = finalEmail
            
            // 以非同步方式註冊使用者
            newUser.signUpInBackgroundWithBlock({ (succeed, error) -> Void in
                
                // 停止旋轉圖示
                stopProgress(self.view)
                if error != nil {
                    self.showAlert(title: "錯誤", message: "\(error)", buttonText: "OK")
                    
                } else {
                    let alertController : UIAlertController!
                    
                    alertController = UIAlertController(title: "成功", message: "已登入" , preferredStyle: .Alert)
                    
                    alertController.addAction(UIAlertAction(title: "確定", style: .Default, handler: {
                        (paramAction:UIAlertAction!) in
                        
                        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Home")
                        self.presentViewController(viewController, animated: true, completion: nil)
                        
                    }))
                    
                    self.presentViewController(alertController, animated: true, completion: nil)
                }
            })
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let _ = touches.first{
            self.view.endEditing(true)
        }
        super.touchesBegan(touches , withEvent:event)
    }
    
}
