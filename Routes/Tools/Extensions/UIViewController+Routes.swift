//
//  UIViewController+Routes.swift
//  Routes
//
//  Created by Angel Betancourt on 5/9/18.
//  Copyright © 2018 Angel. All rights reserved.
//

import UIKit
import SVProgressHUD

extension UIViewController{
    
    func showSimpleAlert(_ message: String){
        
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    func showActivityIndicator(){
        DispatchQueue.main.async {
            SVProgressHUD.show()
        }
    }
    
    func hideActivityIndicator(){
        DispatchQueue.main.async {
            SVProgressHUD.dismiss()
        }
    }
}
