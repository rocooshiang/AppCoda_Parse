//
//  Progress.swift
//  LoginByParse
//
//  Created by Geosat-RD01 on 2015/11/17.
//  Copyright © 2015年 Geosat-RD01. All rights reserved.
//

import Foundation

func startProgress(view : UIView , text : String){
    let loadingNotification = MBProgressHUD.showHUDAddedTo(view, animated: true)
    loadingNotification.mode = MBProgressHUDMode.Indeterminate
    loadingNotification.labelText = text
}

func stopProgress(view : UIView){
    MBProgressHUD.hideAllHUDsForView(view, animated: true)
}
