//
//  ResetPasswordViewController.swift
//  ParseDemo
//
//  Created by Rumiya Murtazina on 7/31/15.
//  Copyright (c) 2015 abearablecode. All rights reserved.
//

import UIKit
import Parse

class ResetPasswordViewController: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let _ = touches.first{
            self.view.endEditing(true)
        }
        super.touchesBegan(touches , withEvent:event)
    }
    
    @IBAction func passwordReset(sender: AnyObject) {
        let email = self.emailField.text
        let finalEmail = email!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        // 傳送重設密碼的要求
        PFUser.requestPasswordResetForEmailInBackground(finalEmail)
        
        showAlert(title: "重設密碼", message: "重設密碼的郵件已經寄送到 \(finalEmail)", buttonText: "OK")
    }

    @IBAction func exitBtn(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
}
