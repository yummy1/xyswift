//
//  NavigationController.swift
//  swiftDemo
//
//  Created by 毛毛 on 2016/12/21.
//  Copyright © 2016年 锐拓. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.isHidden = true      
        let navBar = UINavigationBar.appearance()
        navBar.setBackgroundImage(UIImage.image(withColor: .red, size: navBar.frame.size), for: .default)
        navBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white, NSFontAttributeName:UIFont.systemFont(ofSize: 20)]
        navBar.tintColor = UIColor.white
        navBar.barTintColor = UIColor.white
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count>0 {
            viewController.hidesBottomBarWhenPushed = true
        }
    }

}
