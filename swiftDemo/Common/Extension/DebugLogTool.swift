//
//  DebugLogTool.swift
//  swiftDemo
//
//  Created by 毛毛 on 2016/12/27.
//  Copyright © 2016年 锐拓. All rights reserved.
//

import UIKit

class DebugLogTool: NSObject {
    /*
     *自定义log
     */
    static func debugLog(item: Any){
        #if DEBUG
            print(item)
        #else
            
        #endif
    }
}
