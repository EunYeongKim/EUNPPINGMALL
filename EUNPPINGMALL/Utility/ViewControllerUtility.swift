//
//  ViewControllerUtility.swift
//  EUNPPINGMALL
//
//  Created by 60080252 on 2020/10/20.
//

import Foundation
import UIKit

class ViewControlllerUtility {
    class func getVCInstance(storyboardName: String, vcID: String) -> UIViewController  {
        return UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: vcID)
    }
}
