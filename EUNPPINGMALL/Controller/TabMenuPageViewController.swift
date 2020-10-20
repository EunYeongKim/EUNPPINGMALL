//
//  TabMenuPageViewController.swift
//  EUNPPINGMALL
//
//  Created by 60080252 on 2020/10/13.
//

import UIKit

class TabMenuPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    var menuDelegate: PageIndexDelegate?
    
    let identifiers = [ProductViewController.reuseIdentifier, RecentViewController.reuseIdentifier, WishListViewController.reuseIdentifier]
    
    lazy var VCArray: [UIViewController] = {
        return identifiers.map({ (id: String) -> (UIViewController) in
            return ViewControlllerUtility.getVCInstance(storyboardName: "Main", vcID: id)
        })
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate = self
        
        if let firstVC = VCArray.first {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func setDelegate(_ viewController: UIViewController) {
        guard let vc = viewController as? TabMenuViewController else { return }
        vc.pageVCDelegate = self
    }
    
    required init?(coder: NSCoder) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = VCArray.firstIndex(of: viewController) else { return nil }
        
        let previousIndex = viewControllerIndex - 1
        
        if previousIndex < 0 {
            return VCArray.last
        } else {
            return VCArray[previousIndex]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = VCArray.firstIndex(of: viewController) else { return nil }
        
        let nextIndex = viewControllerIndex + 1
        
        if nextIndex >= VCArray.count {
            return VCArray.first
        } else {
            return VCArray[nextIndex]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        guard let next = pendingViewControllers.first, let vcIndex = VCArray.firstIndex(of: next) else { return }
        if vcIndex >= VCArray.count {
            menuDelegate?.selectMenuItem(pageIndex: 0)
        } else {
            menuDelegate?.selectMenuItem(pageIndex: vcIndex)
        }
    }
}


extension TabMenuPageViewController: PageViewControllerDelegate {
    func scrollPage(pageIndex: Int, previousIndex: Int) {
        let direction: UIPageViewController.NavigationDirection = (previousIndex > pageIndex) ? .reverse : .forward
        
        self.setViewControllers([VCArray[pageIndex]], direction: direction, animated: true, completion: nil)
    }
}
