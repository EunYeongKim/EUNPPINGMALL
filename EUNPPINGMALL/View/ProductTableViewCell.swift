//
//  ProductTableViewCell.swift
//  EUNPPINGMALL
//
//  Created by 60080252 on 2020/10/15.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    var product: Product? {
        didSet {
            guard let p = product else { return }
            if let imageStr = p.img {
                self.img.image = UIImage(named: imageStr)
            } else {
                self.img.image = UIImage(named: "default")
            }
            self.name.text = p.name
            self.price.text = p.price.commaRepresentation + "원"
            
            if p.wish {
                self.heart.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            } else {
                self.heart.setImage(UIImage(systemName: "heart"), for: .normal)
            }
        }
    }
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var heart: UIButton!
    @IBOutlet weak var price: UILabel!
    @IBAction func didTapHeart(_ sender: Any) {
        if Product.dummyProductList[heart.tag].wish {
            Product.dummyProductList[heart.tag].wish = false
            self.heart.setImage(UIImage(systemName: "heart"), for: .normal)
        } else {
            Product.dummyProductList[heart.tag].wish = true
            self.heart.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
        NotificationCenter.default.post(name: Notification.Name.Recent.Changed, object: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
