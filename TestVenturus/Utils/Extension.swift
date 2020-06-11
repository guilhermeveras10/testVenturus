//
//  Extension.swift
//  TestVenturus
//
//  Created by Guilherme Duarte on 11/06/20.
//  Copyright © 2020 Guilherme Duarte. All rights reserved.
//

import Foundation
import UIKit
import JGProgressHUD

extension UIViewController {
    
    static let hud = JGProgressHUD(style: .dark)
    
    func showLoader(_ show: Bool, withText text: String? = "Carregando") {
        view.endEditing(true)
        UIViewController.hud.textLabel.text = text
        
        if show {
            UIViewController.hud.show(in: view)
        } else {
            UIViewController.hud.dismiss()
        }
    }

}
