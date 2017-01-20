//
//  DeviceModel.swift
//  swiftDemo
//
//  Created by 毛毛 on 2016/12/27.
//  Copyright © 2016年 锐拓. All rights reserved.
//

import UIKit
import Foundation

class DeviceModel: NSObject {
    let deviceSize = UIScreen.main.bounds.size
    let iphone4Size = CGSize(width: 320, height: 480)
    let iphone5Size = CGSize(width: 320, height: 568)
    let iphone6Size = CGSize(width: 375, height: 667)
    let iphone6PlusSize = CGSize(width: 414, height: 736)
    let ipadSize = CGSize(width: 768, height: 1024)
    let ipadProSize = CGSize(width: 1024, height: 1336)
    
    func deviceSizeEqualTo(size:CGSize) -> Bool{
        return(deviceSize.height==size.height && deviceSize.width==size.width) || (deviceSize.height==size.width && deviceSize.width==size.height);
    }
    func is_iphone4() -> Bool {
        return self.deviceSizeEqualTo(size: iphone4Size)
    }
    func is_iphone5() -> Bool {
        return self.deviceSizeEqualTo(size: iphone5Size)
    }
    func is_iphone6() -> Bool {
        return self.deviceSizeEqualTo(size: iphone6Size)
    }
    func is_iphone6Plus() -> Bool {
        return self.deviceSizeEqualTo(size: iphone6PlusSize)
    }
    func is_ipad() -> Bool {
        return self.deviceSizeEqualTo(size: ipadSize)
    }
    func is_ipadPro() -> Bool {
        return self.deviceSizeEqualTo(size: ipadProSize)
    }
}
