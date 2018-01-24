//
//  QJMeModel.swift
//  请假帖
//
//  Created by 王旭 on 2018/1/11.
//  Copyright © 2018年 PledgeWX. All rights reserved.
//

import UIKit
import ObjectMapper
class QJMeModel: NSObject,Mappable {
    public var nick_Name : NSString = "" //昵称
    public var current_Team : NSString = "" //当前的团队
    public var current_Position : NSString = "" //当前的职位
    public var headIcon : NSString = "" //头像
    public var photos_wall : QJPhotoModel?  //照片墙
    class func newInstance(map: Map) -> Mappable?{
        return QJMeModel()
    }
    required public init?(map: Map){}
    private override init(){}
    //MARK:数据转换方法
    public func mapping(map: Map)
    {
        
    }
}
