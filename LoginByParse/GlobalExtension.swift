//
//  GlobalExtension.swift
//  MonitorTicket
//
//  Created by Geosat-RD01 on 2015/9/8.
//  Copyright (c) 2015年 Geosat-RD01. All rights reserved.
//

import UIKit
extension UIViewController {
    
    func showAlert(title title: String, message: String, buttonText: String) {
        
        let controller : UIAlertController!
        
        if title == "" {
            //設定Alert View的title、message、style
             controller = UIAlertController(title: nil, message: message, preferredStyle: .Alert)
        }else{
            if message == ""{
                controller = UIAlertController(title: title, message: nil, preferredStyle: .Alert)
            }else{
                controller = UIAlertController(title: title, message: message, preferredStyle: .Alert)
            }
        }
        
        // action sheet(動作表單 按鈕)
        let action = UIAlertAction(title: buttonText, style: .Default, handler: nil)
        
        controller.addAction(action)
        
        //顯示 UIAlertController
        self.presentViewController(controller, animated: true, completion: nil)
    }
    
}