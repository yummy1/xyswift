//
//  String+Extension.swift
//  swiftDemo
//
//  Created by 毛毛 on 2016/12/22.
//  Copyright © 2016年 锐拓. All rights reserved.
//

import Foundation
extension String {
    
    func hexValue() -> Int {
        let str = self.uppercased()
        var sum = 0
        for i in str.utf8 {
            sum = sum * 16 + Int(i) - 48 // 0-9 从48开始
            if i >= 65 {                 // A-Z 从65开始，但有初始值10，所以应该是减去55
                sum -= 7
            }
        }
        return sum
    }


}
