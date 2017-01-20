//
//  SelectedViewController.swift
//  swiftDemo
//
//  Created by 毛毛 on 2016/12/22.
//  Copyright © 2016年 锐拓. All rights reserved.
//

import UIKit

class SelectedViewController: UIViewController {

    var leftCell:LeftTableViewCell?
    //MARK:懒加载
    var tableView:UITableView{
        let tableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: 80, height: self.view.height), style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        //注册cell
        tableView.register(LeftTableViewCell.self, forCellReuseIdentifier: "selectedLeftCell")
        return tableView
    }
    var collectionView:UICollectionView{
        let layout = UICollectionViewFlowLayout()
        let w = (UIScreen.main.bounds.width-80)/3
        let h = w+17
        layout.itemSize = CGSize(width:w,height:h)
        //列间距,行间距,偏移
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        let collectionView = UICollectionView.init(frame: CGRect(x: 80, y: 64, width: self.view.width-80, height: self.view.height-64-50), collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = UIColor.groupTableViewBackground
        collectionView.register(UINib.init(nibName: "SelectedRightCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "selectedRightCell")
        return collectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.tableView)
        self.view.addSubview(self.collectionView)
    }
}
//MARK: - tableView dataSource delegate
extension SelectedViewController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:LeftTableViewCell = tableView.dequeueReusableCell(withIdentifier: "selectedLeftCell", for: indexPath) as! LeftTableViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        if indexPath.row == 0 {
            self.leftCell = cell
            self.leftCell?.setSelected(true, animated: true)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.leftCell?.setSelected(false, animated: true)
        self.leftCell = tableView.cellForRow(at: indexPath) as! LeftTableViewCell?
        self.leftCell?.setSelected(true, animated: true)
    }

}
//MARK: - collectionViewDataSource delegate
extension SelectedViewController:UICollectionViewDataSource, UICollectionViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:SelectedRightCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier:"selectedRightCell", for: indexPath) as! SelectedRightCollectionViewCell
        return cell
    }

}
