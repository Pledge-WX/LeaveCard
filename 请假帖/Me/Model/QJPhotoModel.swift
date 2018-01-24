//
//  QJPhotoModel.swift
//  请假帖
//
//  Created by 王旭 on 2018/1/11.
//  Copyright © 2018年 PledgeWX. All rights reserved.
//

import UIKit
import ObjectMapper

class QJPhotoModel: NSObject,Mappable {
    public var photo_Name : NSString = "" //图片昵称
    public var photo_Thumbnail : NSString = ""  //缩略图
    public var photo_high_Pic : NSString = ""  //高清图
    class func newInstance(map: Map) -> Mappable?{
        return QJPhotoModel()
    }
    required public init?(map: Map){}
    private override init(){}
    //MARK:数据转换方法
    public func mapping(map: Map)
    {
        
    }
}
