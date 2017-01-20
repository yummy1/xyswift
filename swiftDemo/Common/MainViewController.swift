//
//  MainViewController.swift
//  swiftDemo
//
//  Created by 毛毛 on 2016/12/21.
//  Copyright © 2016年 锐拓. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let home = HomeViewController()
        self.addChildVC(childvc: home, itemTittle: "首页", normalImage: UIImage.image(named: "home-grey"), selectedImage: UIImage.image(named: "home-red"))
        
        let selected = SelectedViewController()
        self.addChildVC(childvc: selected, itemTittle: "分类", normalImage: UIImage.image(named: "classify-grey"), selectedImage: UIImage.image(named: "classify-red"))
        
        let shoppingCart = ShoppingCartViewController()
        self.addChildVC(childvc: shoppingCart, itemTittle: "购物车", normalImage: UIImage.image(named: "shoppingCart-grey"), selectedImage: UIImage.image(named: "shoppingCart-red"))
        
        let mine = HomeViewController()
        self.addChildVC(childvc: mine, itemTittle: "个人中心", normalImage: UIImage.image(named: "mine-grey"), selectedImage: UIImage.image(named: "mine-red"))
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    func addChildVC(childvc:UIViewController, itemTittle: String?, normalImage:UIImage?, selectedImage:UIImage?) -> Void {
        childvc.title = itemTittle
        childvc.tabBarItem.image = normalImage
        childvc.tabBarItem.selectedImage = selectedImage?.withRenderingMode(.alwaysOriginal)
        childvc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.red], for: .selected)
        childvc.tabBarItem.setTitleTextAttributes([:], for: .normal)
        let nav = UINavigationController(rootViewController: childvc)
        self.addChildViewController(nav)
    }
    
}
