//
//  LoginViewController.swift
//  ParseDemo
//
//  Created by Rumiya Murtazina on 7/28/15.
//  Copyright (c) 2015 abearablecode. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordField.secureTextEntry = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //為了能夠關閉"註冊"畫面，我們需要定義用來解除的 Segue
    @IBAction func unwindToLogInScreen(segue:UIStoryboardSegue) {
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let _ = touches.first{
            self.view.endEditing(true)
        }
        super.touchesBegan(touches , withEvent:event)
    }
    
    @IBAction func loginAction(sender: AnyObject) {
        var username = self.usernameField.text
        var password = self.passwordField.text
        
        //清除所有空格
        username = username!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        password = password!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        // 驗證文字欄位
        if let username = username where username.characters.count < 5 {
            showAlert(title: "無效", message: "使用者名稱需大於5個字元", buttonText: "OK")
            
        } else if let password = password where password.characters.count < 8 {
            showAlert(title: "無效", message: "密碼需大於8個字元", buttonText: "OK")
            
        } else {
            // 顯示旋轉圖示，代表工作正在進行中
           startProgress(self.view, text: "資訊驗證中...")

            // 送出登入的要求
            PFUser.logInWithUsernameInBackground(username!, password: password!, block: { (user, error) -> Void in
                
                // 停止旋轉圖示
                stopProgress(self.view)
                
                if user != nil {
                    
                    let alertController : UIAlertController!
                    
                    alertController = UIAlertController(title: "登入成功", message: "" , preferredStyle: .Alert)

                    alertController.addAction(UIAlertAction(title: "確定", style: .Default, handler: {
                        (paramAction:UIAlertAction!) in
                        
                        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Home")
                        self.presentViewController(viewController, animated: true, completion: nil)
                        
                    }))
                    
                    self.presentViewController(alertController, animated: true, completion: nil)
                    
                    
                } else {
                    self.showAlert(title: "錯誤", message: "\(error)", buttonText: "OK")
                }
            })
        }
    }

    
}
