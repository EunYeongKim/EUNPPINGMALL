//
//  TabMenuDelegate.swift
//  EUNPPINGMALL
//
//  Created by 60080252 on 2020/10/13.
//

import Foundation

protocol PageViewControllerDelegate {
    func scrollPage(pageIndex: Int, previousIndex: Int)
}

protocol PageIndexDelegate {
    func selectMenuItem(pageIndex: Int)
}
