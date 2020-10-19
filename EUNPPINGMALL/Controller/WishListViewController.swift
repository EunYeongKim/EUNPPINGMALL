//
//  WishListViewController.swift
//  EUNPPINGMALL
//
//  Created by 60080252 on 2020/10/13.
//

import UIKit

class WishListViewController: UIViewController {

    @IBOutlet weak var wishTableView: UITableView!
    var wishIndexList: [Int] = []
    
    func showProductPopUp(index: Int) {
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PopUpViewController") as? PopUpViewController else { return }
        
        vc.modalPresentationStyle = .overCurrentContext
        vc.product = Product.dummyProductList[index]
        present(vc, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setWishIndexList()
    }
    
    func setWishIndexList() {
        wishIndexList = Product.dummyProductList.indices.filter({
            Product.dummyProductList[$0].wish
        })
    }
}

extension WishListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wishIndexList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WishCell", for: indexPath) as! ProductTableViewCell
        
        cell.heart.tag = wishIndexList[indexPath.row]
        cell.product = Product.dummyProductList[cell.heart.tag]
        
        return cell
    }
}

extension WishListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Product.dummyRecentList.insert(wishIndexList[indexPath.row])
        NotificationCenter.default.post(name: Notification.Name.Recent.Changed, object: nil)
        showProductPopUp(index: indexPath.row)
    }
}
