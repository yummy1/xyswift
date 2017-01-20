//
//  MBProgressHUD+Extension.swift
//  swiftDemo
//
//  Created by 毛毛 on 2016/12/23.
//  Copyright © 2016年 锐拓. All rights reserved.
//

import Foundation
import UIKit

extension MBProgressHUD{
    //MARK: - 初始化
    func show(text:String?, icon:String!, onView:UIView!, completion:MBProgressHUDCompletionBlock?){
        var optionalView = Optional(onView)
        if optionalView == nil {
            optionalView = UIApplication.shared.windows.last
        }
        let hud = MBProgressHUD.showAdded(to: optionalView!!, animated: true)
        hud.bezelView.layer.cornerRadius = 10
        hud.bezelView.color = UIColor.init(red: 68, green: 68, blue: 68, alpha: 0.8)
        hud.label.text = text
        hud.contentColor = UIColor.white
        let optionalIcon = Optional(icon)
        if (optionalIcon != nil) {
            hud.customView = UIImageView.init(image: UIImage.image(named: optionalIcon!!))
        }
        hud.mode = MBProgressHUDMode.customView
        hud.completionBlock = completionBlock
        hud.removeFromSuperViewOnHide = true
        hud.hide(animated: true, afterDelay: 1)
    }
    //MARK: - 展示错误信息
    func showError(error:String?){
        self.showError(error: error, onView: nil)
    }
    func showError(error:String?, completion:MBProgressHUDCompletionBlock?){
        self.showError(error: error, onView: nil, completion: completion)
    }
    func showError(error:String?, onView:UIView?){
        self.showError(error: error, onView: onView, completion: nil)
    }
    func showError(error:String?, onView:UIView?, completion:MBProgressHUDCompletionBlock?){
        self.show(text: error, icon: "touming-cuo", onView: onView, completion: completion)
    }
    //MARK: - 展示成功信息
    func showSuccess(success:String?){
        self.showSuccess(success: success, onView: nil)
    }
    func showSuccess(success:String?, completion:MBProgressHUDCompletionBlock?){
        self.showSuccess(success: success, onView: nil, completion: completion)
    }
    func showSuccess(success:String?, onView:UIView?){
        self.showSuccess(success: success, onView: onView, completion: nil)
    }
    func showSuccess(success:String?, onView:UIView?, completion:MBProgressHUDCompletionBlock?){
        self.show(text: success, icon: "touming-cuo", onView: onView, completion: completion)
    }
    //MARK: - 展示的信息
    func show(message:String?){
        self.show(message: message, onView: nil)
    }
    func show(message:String?, completion:MBProgressHUDCompletionBlock?){
        self.show(message: message, onView: nil, completion: completion)
    }
    func show(message:String?, onView:UIView?){
        self.show(message: message, onView: onView, completion: nil)
    }
    func show(message:String?, onView:UIView?, completion:MBProgressHUDCompletionBlock?){
        var optionalView = Optional(onView)
        if optionalView == nil {
            optionalView = UIApplication.shared.windows.last
        }
        self.show(text: message, icon: nil, onView: optionalView!!, completion: completion)
    }
    //MARK: - 展示正在加载的信息
    func showLoading(message:String?) -> MBProgressHUD{
        return self.showLoading(message: message, onView: nil)
    }
    func showLoading(message:String?, withCover:Bool?) -> MBProgressHUD{
        return self.showLoading(message: message, onView: nil, withCover:withCover)
    }
    func showLoading(message:String?, onView:UIView?) -> MBProgressHUD{
        return self.showLoading(message: message, onView: onView, withCover:true)
    }
    func showLoading(message:String?, onView:UIView?, withCover:Bool?) -> MBProgressHUD{
        var optionalView = Optional(onView)
        if optionalView == nil {
            optionalView = UIApplication.shared.windows.last
        }
        let hud = MBProgressHUD.showAdded(to: optionalView!!, animated: true)
        hud.label.text = message
        hud.removeFromSuperViewOnHide = true
        hud.hide(animated: withCover!)
        return hud
    }
    //MARK: - 隐藏HUD
    func hide(){
        self.hide(fromView: nil)
    }
    func hide(fromView:UIView?){
        MBProgressHUD.hide(for: fromView!, animated: true)
    }
}
