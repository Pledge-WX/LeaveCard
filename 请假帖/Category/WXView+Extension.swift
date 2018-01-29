//
//  WXView+Extension.swift
//  请假帖
//
//  Created by 王旭 on 2018/1/25.
//  Copyright © 2018年 PledgeWX. All rights reserved.
//

import Foundation
import UIKit
extension UIView {
    //MARK: - 初始化登录界面的输入框样式
    func creatLoginView(){
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.mainColor.cgColor
        self.backgroundColor = .white
        self.layer.cornerRadius = 8.0
        self.layer.masksToBounds = true
    }
    //MARK: - 初始化注册或者重置密码的父View
    func createSuperView(){
        self.backgroundColor = UIColor.white
        self.snp.makeConstraints { (make) in
            make.centerX.equalTo(kScreenWidth/2)
            make.top.equalTo(76)
            make.width.equalTo(kScreenWidth)
            make.height.equalTo(80)
        }
    }
    //MARK: - 初始化橙色的横线
    func createLineView(){
        self.backgroundColor = UIColor.mainColor
        self.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.height.equalTo(0.5)
            make.left.equalTo(0)
            make.right.equalTo(0)
        }
    }
}
