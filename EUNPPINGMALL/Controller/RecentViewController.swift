//
//  RecentViewController.swift
//  EUNPPINGMALL
//
//  Created by 60080252 on 2020/10/13.
//

import UIKit

class RecentViewController: UIViewController {
    
    @IBOutlet weak var recentTableView: UITableView!
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: Notification.Name.Recent.Changed, object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setNotificationObserver()
    }
    
    func configureUI() {
        if Product.dummyRecentList.count == 0 {
            recentTableView.isHidden = true
        }
    }
    
    func setNotificationObserver() {
        NotificationCenter.default.addObserver(forName: Notification.Name.Recent.Changed, object: nil, queue: OperationQueue.main) { [weak self] (noti) in
            self?.recentTableView.reloadData()
        }
    }
}

extension RecentViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Product.dummyRecentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecentCell", for: indexPath) as! ProductTableViewCell
        
        cell.heart.tag = Product.dummyRecentList[Product.dummyRecentList.index(Product.dummyRecentList.startIndex, offsetBy: indexPath.row)]
        cell.product = Product.dummyProductList[cell.heart.tag]
        
        return cell
    }
}

extension RecentViewController: UITableViewDelegate {
    
}
