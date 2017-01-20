//
//  ProductCollectionViewCell.swift
//  swiftDemo
//
//  Created by 毛毛 on 2016/12/22.
//  Copyright © 2016年 锐拓. All rights reserved.
//

import UIKit
import Kingfisher

class ProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var goodsImage: UIImageView!
    @IBOutlet weak var goodsName: UILabel!
    @IBOutlet weak var goodsPrice: UILabel!
    @IBOutlet weak var source: UILabel!
    var model:GoodsModel?{
        didSet{
            goodsImage.kf.setImage(with: model?.photoUrl?.mj_url())
            goodsName.text = model?.goodsName
            goodsPrice.text = model?.goodsPrice
            let sourceId:Int = (model?.sourceId)!
            switch sourceId {
            case 1:
                break
            default:
                break
                
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
