//
//  UIViewController+Alert.swift
//  HimMemo
//
//  Created by Himchan Park on 2020/05/29.
//  Copyright © 2020 Himchan Park. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func alert(title: String = "알림", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAcion = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(okAcion)
        present(alert, animated: true, completion: nil)
        
    }
    
}
