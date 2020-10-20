//
//  NSObjectExtension.swift
//  EUNPPINGMALL
//
//  Created by 60080252 on 2020/10/19.
//

import Foundation

extension NSObject {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
