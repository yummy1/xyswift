//
//  ShoppingCartTableViewCell.swift
//  swiftDemo
//
//  Created by 毛毛 on 2016/12/24.
//  Copyright © 2016年 锐拓. All rights reserved.
//

import UIKit

class ShoppingCartTableViewCell: UITableViewCell {

    weak var delegate:ShoppingCartTableViewCellDelegate?
//    weak var dataSource:ShoppingCartTableViewCellOptionalDelegate?
    @IBOutlet weak var selectedProduct: UIImageView!
    @IBOutlet weak var goodPrice: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func clickSelect(_ sender: Any) {
        if (self.selectedProduct.image?.isEqual(UIImage(named: "moren-red")))! {
            self.selectedProduct.image = UIImage(named: "moren")
            self.delegate?.selectedProducts(cell: self, seleted: false)
        }else{
            self.selectedProduct.image = UIImage(named: "moren-red")
            self.delegate?.selectedProducts(cell: self, seleted: true)
        }
    }
}
//必须实现的协议
protocol ShoppingCartTableViewCellDelegate:NSObjectProtocol {
    func selectedProducts(cell:ShoppingCartTableViewCell, seleted:Bool)
}
////可选协议
//@objc protocol ShoppingCartTableViewCellOptionalDelegate:NSObjectProtocol{
//    @objc optional func optionalFunc(str:String){
//    
//    }
//}
