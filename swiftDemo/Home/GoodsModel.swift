//
//  GoodsModel.swift
//  swiftDemo
//
//  Created by 毛毛 on 2016/12/29.
//  Copyright © 2016年 锐拓. All rights reserved.
//

import UIKit

class GoodsModel: NSObject {
//MARK:商品信息
    /** 商品id */
    var goodsId:Int = 0
    /** 商品主图 */
    var photoUrl:String?
    /** 商品标题 */
    var goodsName:String?
    /** 商品现价 */
    var goodsPrice:String?
    /** 商品原价 */
    var unitCost:String?
    /** 商品已售数量 */
    var monsales:Int = 0
    /** 商品来源 0全部1淘宝2天猫 */
    var sourceId:Int = 0
    /** 外链url */
    var weblinkurl:String?
    
}
