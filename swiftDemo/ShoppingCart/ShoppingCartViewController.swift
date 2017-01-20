//
//  ShoppingCartViewController.swift
//  swiftDemo
//
//  Created by 毛毛 on 2016/12/24.
//  Copyright © 2016年 锐拓. All rights reserved.
//

import UIKit

class ShoppingCartViewController: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalPrice: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.tableView.separatorStyle = .none
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib.init(nibName:"ShoppingCartTableViewCell", bundle: nil), forCellReuseIdentifier: "shoppingCartCell")
    }
    
}
//MARK: - tableView dataSource delegate
extension ShoppingCartViewController:UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ShoppingCartTableViewCell = tableView.dequeueReusableCell(withIdentifier: "shoppingCartCell", for: indexPath) as! ShoppingCartTableViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.delegate = self
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
//MARK: - ShoppingCartTableViewCellDelegate
extension ShoppingCartViewController:ShoppingCartTableViewCellDelegate{
    func selectedProducts(cell: ShoppingCartTableViewCell, seleted: Bool) {
        let total = (self.totalPrice.text! as NSString).floatValue
        let goodPrice = (cell.goodPrice.text! as NSString).floatValue
        if seleted {
            self.totalPrice.text = String(total + goodPrice)
        }else{
            self.totalPrice.text = String(total - goodPrice)
        }
    }
}





