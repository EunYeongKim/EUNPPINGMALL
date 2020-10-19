//
//  PopUpViewController.swift
//  EUNPPINGMALL
//
//  Created by 60080252 on 2020/10/16.
//

import UIKit

class PopUpViewController: UIViewController {

    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var heart: UIButton!
    @IBAction func didTapHeart(_ sender: Any) {
        if Product.dummyProductList[heart.tag].wish {
            Product.dummyProductList[heart.tag].wish = false
            self.heart.setImage(UIImage(systemName: "heart"), for: .normal)
        } else {
            Product.dummyProductList[heart.tag].wish = true
            self.heart.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
    }
    
    @IBAction func didTapDismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    var product: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    func configureUI() {
        popUpView.layer.cornerRadius = 10
        desc.sizeToFit()
        
        guard let p = product else { return }
        self.name.text = p.name
        self.price.text = p.price.commaRepresentation
        self.desc.text = p.description

        if let img = p.img {
            self.img.image = UIImage(named: img)
        } else {
            self.img.image = UIImage(named: "default")
        }

        if p.wish {
            self.heart.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            self.heart.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
}
