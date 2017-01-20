//
//  HomeViewController.swift
//  swiftDemo
//
//  Created by 毛毛 on 2016/12/21.
//  Copyright © 2016年 锐拓. All rights reserved.
//

import UIKit
import PullToRefresh
import SwiftyJSON
import MJExtension


class HomeViewController: UIViewController {
    //1：从新下拉刷新；0：表示上拉刷新时
    var numberOne:NSInteger = 1
    //从零页开始
    var currentPage:NSInteger = 0
    //数据
    var dataArr : [GoodsModel]?
    
    var collectionView:UICollectionView{
        let layout = UICollectionViewFlowLayout()
        let w = (UIScreen.main.bounds.width-30)/2
        let h = CGFloat(w+84)
        layout.itemSize = CGSize(width:w,height:h)
        //列间距,行间距,偏移
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10)
        let collectionView = UICollectionView.init(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.groupTableViewBackground
        collectionView.register(UINib.init(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductCell")
        return collectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.collectionView)
//        self.setupPullToRefresh()
//        self.collectionView.startRefreshing(at: .top)
        self.refreshOnHome()
    }
    func setupPullToRefresh() {
        self.collectionView.addPullToRefresh(PullToRefresh()) { [weak self] in
            self?.refreshFromOne()
        }
        
        self.collectionView.addPullToRefresh(PullToRefresh(position: .bottom)) { [weak self] in
            self?.reloadMoreOnHome()
        }
    }
    //MARK: - 网络请求
    func refreshFromOne(){
        self.currentPage = 0
        self.numberOne = 1
        refreshOnHome()
    }
    func refreshOnHome(){
        var params = [String:String]()
        params["GoodsTypeoneID"] = "0"
        params["GoodsTypeTwoId"] = "0"
        params["pageSize"] = "20"
        params["pageNo"] = "1"
        params["PriceIncerase"] = "-1"
        params["Newest"] = "0"
        params["LowPrice"] = "0"
        params["HighPrice"] = "0"
        params["sourceId"] = "0"
        params["goodsName"] = "-1"
        NetworkTool.requestData(type: .post, URLString: mSelectProductUrl, parameters: params, success: { (response,retcode,msg) in
            DebugLogTool.debugLog(item: response)
            if retcode == NetworkRetcode.NetworkRetcodeSuccess{
                DebugLogTool.debugLog(item: "成功")
//                if self.numberOne==1 {
//                    self.dataArr.removeAll()
//                    self.numberOne = 0
//                }
                
                let datas = JSON(response)["data"]["list"].rawValue
                let model = GoodsModel.mj_objectArray(withKeyValuesArray: datas) as Array
                if model.count == 0{
                    if (self.dataArr?.count != 0){
                        DebugLogTool.debugLog(item: "亲，没有更多了哦")
                    }else{
                        DebugLogTool.debugLog(item: "亲，没有商品哦")
                    }
                }
                let models:[GoodsModel] = model as! [GoodsModel]
                //添加
                self.dataArr?.append(contentsOf: models)
                //刷新
                self.collectionView.reloadData()
            }else{
                DebugLogTool.debugLog(item: "亲，没有商品哦")
                self.dataArr?.removeAll()
                self.collectionView.reloadData()
            }
        }) { (error) in
            DebugLogTool.debugLog(item: error)
        }
//        self.collectionView.endRefreshing(at: .top)
//        self.collectionView.endRefreshing(at: .bottom)
    }
    
    func reloadMoreOnHome() {
        refreshOnHome()
    }
//    deinit {
//        self.collectionView.removePullToRefresh(collectionView.topPullToRefresh!)
//        self.collectionView.removePullToRefresh(collectionView.bottomPullToRefresh!)
//    }
}

//MARK: - UICollectionViewDataSource  delegate
extension HomeViewController:UICollectionViewDataSource, UICollectionViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataArr!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"ProductCell", for: indexPath)
        return cell
    }
}
