//
//  tabCollectionViewCell.swift
//  EUNPPINGMALL
//
//  Created by 60080252 on 2020/10/13.
//

import UIKit

class TabMenuCollectionViewCell: UICollectionViewCell {
    var menuStr: String? {
        didSet {
            guard let menu = menuStr else { return }
            self.menuLabel.text = menu
        }
    }
    
    @IBOutlet weak var menuLabel: UILabel!

    override func prepareForReuse() {
        isSelected = false
    }
}
