//
//  UIViewController.swift
//  card-generator
//
//  Created by Mohamed Ali on 20/09/2022.
//

import UIKit
import RappleProgressHUD

extension UIViewController {
    
    func startLoading() {
        RappleActivityIndicatorView.startAnimatingWithLabel("انتظر من فضلك", attributes: RappleModernAttributes)
    }
    
    func stopLoading() {
        RappleActivityIndicatorView.stopAnimation()
    }
}
