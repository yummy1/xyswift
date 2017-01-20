//
//  Common.swift
//  swiftDemo
//
//  Created by 毛毛 on 2016/12/27.
//  Copyright © 2016年 锐拓. All rights reserved.
//

import UIKit

//MARK:系统定义宏
let TheApp = UIApplication.shared
let TheAppDelegate = TheApp.delegate
let TheUserDefaults = UserDefaults.standard
let TheNotificationCenter = NotificationQueue.default

//MARK:项目主题色
let ThemeRedColor = UIColor.RGB_Float(r: 245, g: 41, b: 14)

//MARK:屏幕适配
let MainScreenWidth = UIScreen.main.bounds.size.width
let MainScreenHeight = UIScreen.main.bounds.size.height

//MARK:全部URL
let baseUrl = "https://www.xiuyuewang.com/"
/** 请求商品列表 */
let mSelectProductUrl = baseUrl + "selection.action"
//参数：GoodsTypeoneID:一级分类（首页从0开始，分类从1开始）  GoodsTypeTwoId:二级分类(首页默认为0表示不用，分类从1开始)  PriceIncerase:-1:默认不选，1:价格升，0:价格降   Newest:0:默认 ，1:最新 LowPrice:最低价格 HightPrice:最高价格 sourceId:1来源（0全部1淘宝2天猫3特卖商城）goodsName:搜索标题  pageSize:每页个数   pageNo:第几页
