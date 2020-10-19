//
//  PurchasesViewController.swift
//  EUNPPINGMALL
//
//  Created by 60080252 on 2020/10/13.
//

import UIKit

class ProductViewController: UIViewController {
    
    @IBOutlet weak var productTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showProductPopUp(index: Int) {
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PopUpViewController") as? PopUpViewController else { return }
        
        vc.modalPresentationStyle = .overCurrentContext
        vc.product = Product.dummyProductList[index]
        present(vc, animated: true, completion: nil)
    }
}

extension ProductViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Product.dummyProductList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductTableViewCell
        
        cell.heart.tag = indexPath.row
        cell.product = Product.dummyProductList[indexPath.row]
        
        return cell
    }
}

extension ProductViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Product.dummyRecentList.insert(indexPath.row)
        NotificationCenter.default.post(name: Notification.Name.Recent.Changed, object: nil)
        showProductPopUp(index: indexPath.row)
    }
}
