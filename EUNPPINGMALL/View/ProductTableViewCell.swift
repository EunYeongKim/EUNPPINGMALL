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
            self.img.image = UIImage(named: p.img ?? "default")
            self.name.text = p.name
            self.price.text = p.price.commaRepresentation + "원"
            self.heart.setImage(UIImage(systemName: p.wish ? "heart.fill" : "heart"), for: .normal)
        }
    }
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var heart: UIButton!
    @IBOutlet weak var price: UILabel!
    @IBAction func didTapHeart(_ sender: Any) {
        guard let p = product else { return }
        if p.wish {
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
