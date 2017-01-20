//
//  NetworkTool.swift
//  swiftDemo
//
//  Created by 毛毛 on 2016/12/26.
//  Copyright © 2016年 锐拓. All rights reserved.
//

import UIKit

/**
 *  网络请求返回的状态字枚举
 */
enum NetworkRetcode:NSInteger {
    /**
     *  成功 - 0
     */
    case NetworkRetcodeSuccess = 0
    /**
     *  客户端端参数错误
     */
    case NetworkRetcodeClientError
    /**
     *  服务器端参数错误
     */
    case NetworkRetcodeSeverError
}
//MARK: - 上传模型
class UploadDataModel: NSObject {
    /** 文件的二进制数据 */
    var data:Data?
    /** 上传后的文件名 */
    var fileName:String?
    /** mimeType */
    var mimeType:String?
    /** 对应服务器的参数名 */
    var paramName:String?
    
    func uploadModel(data:Data, fileName:String, mimeType:String, paramName:String) -> UploadDataModel{
        let model:UploadDataModel = UploadDataModel()
        model.data = data
        model.fileName = fileName
        model.mimeType = mimeType
        model.paramName = paramName
        return model
    }
}
//MARK: - 网络请求
import Alamofire
import SwiftyJSON
enum MethodType {
    case get
    case post
}
class NetworkTool: NSObject {
    /** 文件后缀 .jpg */
    var NetworkFileMimeTypeJPG:NSString = "image/jpg"
    /** 文件后缀 .jpeg */
    var NetworkFileMimeTypeJPEG:NSString = "image/jpeg"
    /** 文件后缀 .png */
    var NetworkFileMimeTypePNG:NSString = "image/png"
    /** 文件后缀 .doc */
    var NetworkFileMimeTypeDOC:NSString = "application/msword"
    /** 文件后缀 .xls */
    var NetworkFileMimeTypeXLS:NSString = "application/vnd.ms-excel"
    
    
    class func requestData(type:MethodType, URLString:String, parameters:[String:Any]? = nil, success : @escaping (_ response : [String : AnyObject], _ retcode:NetworkRetcode, _ msg:String)->(), failture : @escaping (_ error : Error)->()){
        
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        Alamofire.request(URLString, method: method, parameters: parameters).responseJSON { (response) in
            switch response.result {
            case .success:
                //当响应成功是，使用临时变量value接受服务器返回的信息并判断是否为[String: AnyObject]类型 如果是那么将其传给其定义方法中的success
                if let value = response.result.value as? [String: AnyObject] {
                    let code:NSInteger = value["code"] as! NSInteger
                    success(value, NetworkRetcode(rawValue: code)! , value["msg"] as! String)
                }
            case .failure(let error):
                failture(error)
                print("error:\(error)")
            }
        }
        
    }
    
    
    class func upLoadImageRequest(urlString : String, params:[String:String], files:[UploadDataModel],success : @escaping (_ response : [String : AnyObject])->(), failture : @escaping (_ error : Error)->()){
        let headers = ["content-type":"multipart/form-data"]
        Alamofire.upload(
            multipartFormData: { multipartFormData in
                //多张图片上传
                let keys = params.keys
                for(key) in keys{
                    let value = params["key"]
                    multipartFormData.append( (value?.data(using: String.Encoding.utf8)!)!, withName: String(key))
                }
                for i in 0..<files.count {
                    let model:UploadDataModel = files[i]
                    multipartFormData.append(model.data!, withName: model.paramName!, fileName: model.fileName!, mimeType: model.mimeType!)
                }
        },
            to: urlString,
            headers: headers,
            encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseJSON { response in
                        if let value = response.result.value as? [String: AnyObject]{
                            success(value)
//                            let json = JSON(value)
                        }
                    }
                case .failure(let encodingError):
                    failture(encodingError)
                }
        })
    }
}
extension Notification.Name{
    public struct Task{
        /*用法：
         *NotificationCenter.default.post(name: Notification.Name.Task.NetworkFailureNotice, object: self, userInfo:[Notification.Key.Task:tast])
         */
        public static let NetworkFailureNotice = Notification.Name(rawValue:"org.networktool.notification.name.task.networkFailureNotice")
        
    }
}
