//
//  LeftTableViewCell.swift
//  swiftDemo
//
//  Created by 毛毛 on 2016/12/23.
//  Copyright © 2016年 锐拓. All rights reserved.
//

import UIKit

class LeftTableViewCell: UITableViewCell {

    var redView: UIView?
    var leftLabel:UILabel?
    
    public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
    }
    
    func setupUI(){
        //背景色暂定红色
        self.backgroundColor = UIColor.white
        
        self.redView = UIView.init(frame: CGRect(x: 0, y: 0, width: 3, height: 50))
        self.redView?.backgroundColor = UIColor.red
        self.addSubview(self.redView!)
        self.redView?.isHidden = false
        
        self.leftLabel = UILabel.init(frame: CGRect(x: 10, y: 0, width: 60, height: 50))
        self.leftLabel?.text = "女装"
        self.leftLabel?.textColor = UIColor.black
        self.leftLabel?.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(self.leftLabel!)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            //出现、白色
            self.redView?.isHidden = false
            self.backgroundColor = UIColor.white
        }else{
//            隐藏、灰色
            self.redView?.isHidden = true
            self.backgroundColor = UIColor.groupTableViewBackground
        }
    }

}









