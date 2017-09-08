//
//  KKBaseViewController.swift
//  ETNavBarTransparentDemo
//
//  Created by kobe on 2017/9/8.
//  Copyright © 2017年 EnderTan. All rights reserved.
//

import UIKit

class KKBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()

        if let navigationController = navigationController {
            if navigationController.viewControllers.index(of: self)! > 0 {
                setUpLeft()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let navigationController = navigationController,
            let interactivePopGestureRecognizer = navigationController.interactivePopGestureRecognizer else { return }
        interactivePopGestureRecognizer.delegate = self
    }
    
    fileprivate func setUpViews() {
        extendedLayoutIncludesOpaqueBars = true
        edgesForExtendedLayout = .all
        navigationController?.navigationBar.isTranslucent = false
        automaticallyAdjustsScrollViewInsets = false
        
        navBarBgColor = .defaultNavBarBgColor
        navBarTintColor  = .defaultNavBarTintColor
        
        view.backgroundColor = UIColor.lightGray
    }
    
    fileprivate func setUpLeft() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "personalPageCommonCommunity"), style: .plain, target: self, action: #selector(leftAction))
    }

    func leftAction() {
        navigationController?.popViewController(animated: true)
    }
    
    lazy var contentView: UIScrollView = {
        let contentView = UIScrollView(frame: CGRect(x: 0, y: 64, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 64))
        contentView.bounces = false
        contentView.showsVerticalScrollIndicator = false
        contentView.showsHorizontalScrollIndicator = false
        contentView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 64)
        return contentView
    }()
}

extension KKBaseViewController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if let navigationController = navigationController {
            if navigationController.viewControllers.index(of: self)! > 0 {
                return true
            }
        }
        return false
    }
}
