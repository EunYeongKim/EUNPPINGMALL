//
//  TabMenuViewController.swift
//  EUNPPINGMALL
//
//  Created by 60080252 on 2020/10/13.
//

import UIKit

class TabMenuViewController: UIViewController {
    let menu = ["PRODUCT", "RECENT", "WISHLIST"]
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var menuUnderBar: UIView!
    
    var pageVCDelegate: PageViewControllerDelegate?
    var constraints: [NSLayoutConstraint] = []
    var previousIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
        setFirstIndexIsSelected()
    }

    func setFirstIndexIsSelected() {
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        collectionView(collectionView, didSelectItemAt: selectedIndexPath)
        collectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: .right)
    }
    
    func setDelegate() {
        guard let vc = self.children.first as? TabMenuPageViewController else { return }
        vc.menuDelegate = self
        vc.setDelegate(self)
    }
    
    func moveMenuUnderBar(indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? TabMenuCollectionViewCell else { return }
        
        NSLayoutConstraint.deactivate(constraints)
        menuUnderBar.translatesAutoresizingMaskIntoConstraints = false
        constraints = [ menuUnderBar.leadingAnchor.constraint(equalTo: cell.leadingAnchor), menuUnderBar.trailingAnchor.constraint(equalTo: cell.trailingAnchor) ]
        NSLayoutConstraint.activate(constraints)
        
        UIView.animate(withDuration: 0.3) { self.view.layoutIfNeeded() }
    }
}

extension TabMenuViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as! TabMenuCollectionViewCell
        let target = menu[indexPath.row]
        cell.menuStr = target
        
        return cell
    }
}

extension TabMenuViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        moveMenuUnderBar(indexPath: indexPath)
        pageVCDelegate?.scrollPage(pageIndex: indexPath.row, previousIndex: previousIndex)
        previousIndex = indexPath.row
    }
}

extension TabMenuViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width / CGFloat(menu.count)
        menuUnderBar.frame.size.width = width
        return CGSize(width: width, height: 50)
    }
}

extension TabMenuViewController: PageIndexDelegate {
    func selectMenuItem(pageIndex: Int) {
        let selectedIndexPath = IndexPath(item: pageIndex, section: 0)
        moveMenuUnderBar(indexPath: selectedIndexPath)
    }
}
