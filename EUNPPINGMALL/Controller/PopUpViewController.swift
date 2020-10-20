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
        guard let p = product else { return }
        if p.wish {
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

        self.img.image = UIImage(named: p.img ?? "default")
        
        self.heart.setImage(UIImage(systemName: p.wish ? "heart.fill" : "heart"), for: .normal)
    }
}
