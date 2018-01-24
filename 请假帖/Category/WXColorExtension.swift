//
//  WXColorExtension.swift
//  Demo001
//
//  Created by 王旭 on 2018/1/10.
//  Copyright © 2018年 PledgeWX. All rights reserved.
//

import UIKit

extension UIColor {
    //背景色
    @nonobjc static var bgViewColor: UIColor {//浅橙色
        get { return UIColor.colorWithHexString("F0F0F0")}
    }
    //主题色
    @nonobjc static var mainColor: UIColor {//深橙色
        get {return UIColor.colorWithHexString("FD8224")}
    }
    //一级文本颜色
    @nonobjc static var normalTextColor: UIColor {
        
        get {return UIColor.colorWithHexString("FD8224")}
        
    }
    //二级文本颜色
    @nonobjc static var twoTextColor: UIColor {
        
        get {return UIColor.colorWithHexString("1E2022")}
        
    }
    
    //三级文本颜色
    @nonobjc static var threeTextColor: UIColor {
        
        get {return UIColor.colorWithHexString("5C5E66")}
    }
    
    //线条灰
    @nonobjc static var grayLineColor: UIColor {
        
        get {return UIColor.colorWithHexString("cccccc")}
        
    }
    
    //深灰线
    @nonobjc static var twoLineColor: UIColor {
        
        get {return UIColor.colorWithHexString("666666")}
        
    }
    
    //价格等重要颜色
    @nonobjc static var priceColor: UIColor {
        
        get {return UIColor.colorWithHexString("f47411")}
        
    }
    
    //电话颜色
    @nonobjc static var phoneColor: UIColor {
        
        get {return UIColor.colorWithHexString("66cc00")}
        
    }
    
    //亮色
    @nonobjc static var brightColor: UIColor {
        
        get {return UIColor.colorWithHexString("0099cc")}
        
    }
    //MARK: - 颜色转换
    class func colorWithHexString(_ str: String) -> UIColor {
        var cString: NSString = str.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).uppercased() as NSString
        if cString.length < 6 {
            return UIColor.clear
        }
        if cString.hasPrefix("0X") {
            cString = cString.substring(from: 2) as NSString
        }
        if cString.hasPrefix("#") {
            cString = cString.substring(from: 1) as NSString
        }
        if cString.length != 6 {
            return UIColor.clear
        }
        let rString = cString.substring(with: NSMakeRange(0, 2))
        let gString = cString.substring(with: NSMakeRange(2, 2))
        let bString = cString.substring(with: NSMakeRange(4, 2))
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
    }
}
