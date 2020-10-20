//
//  PopUpUtility.swift
//  EUNPPINGMALL
//
//  Created by 60080252 on 2020/10/20.
//

import Foundation
import UIKit

class PopUpUtility {
    class func showProductPopUp(viewController: UIViewController, product: Product) {
        guard let vc = ViewControlllerUtility.getVCInstance(storyboardName: "Main", vcID: PopUpViewController.reuseIdentifier) as? PopUpViewController else { return }
        
        vc.modalPresentationStyle = .overCurrentContext
        vc.product = product
        viewController.present(vc, animated: true, completion: nil)
    }
}
