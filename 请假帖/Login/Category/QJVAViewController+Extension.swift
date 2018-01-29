//
//  QJVAViewController+Extension.swift
//  请假帖
//
//  Created by 王旭 on 2018/1/29.
//  Copyright © 2018年 PledgeWX. All rights reserved.
//

import Foundation
import UIKit

extension QJVerifyAccountViewController{
    func setupVerifyAccountUI(){
        let superView:UIView = UIView()//登录的背景View
        view.addSubview(superView)
        superView.createSuperView()
        //MARK: - 设置横线
        let lineView:UIView = UIView()
        superView.addSubview(lineView)
        lineView.createLineView()
        for i in 0..<2 {
            let titles:UILabel = UILabel()
            superView.addSubview(titles)
            titles.textColor = UIColor.twoTextColor
            titles.textAlignment = .left
            titles.font = WXFontConstant.boldFont13
            titles.text = i == 0 ? "手机号码：" : "验证码："
            let textField:UITextField = UITextField()
            superView.addSubview(textField)
            textField.borderStyle = .none
            textField.clearButtonMode = .always
            textField.textAlignment = .left
            textField.font = WXFontConstant.font13
            textField.placeholder = i == 0 ? "请输入手机号码":"请输入验证码"
            titles.snp.makeConstraints({ (make) in
                make.left.equalTo(15)
                if i == 0{
                    self.phoneTitle = titles
                    make.top.equalTo(superView.snp.top)
                    make.bottom.equalTo(lineView.snp.top).offset(5)
                }else{
                    self.vCodeTitle = titles
                    make.top.equalTo(lineView.snp.bottom).offset(5)
                    make.bottom.equalTo(superView.snp.bottom)
                }
            })
            textField.snp.makeConstraints({ (make) in
                if i == 0{
                    self.phoneTextField = textField
                    make.centerY.equalTo(self.phoneTitle.snp.centerY)
                    make.left.equalTo(self.phoneTitle.snp.right).offset(0)
                    make.right.equalTo(superView.snp.right).offset(-15)
                    make.height.equalTo(self.phoneTitle.snp.height).offset(0)
                }else{
                    textField.isSecureTextEntry = true
                    self.vCodeTextField = textField
                    make.centerY.equalTo(self.vCodeTitle.snp.centerY)
                    make.left.equalTo(self.vCodeTitle.snp.right).offset(13)
                    make.right.equalTo(superView.snp.right).offset(-85)
                    make.height.equalTo(self.vCodeTitle.snp.height).offset(0)
                }
            })
        }
        //MARK: - 设置验证码按钮
        vCodeButton.set(image: nil, title: "获取验证码", titleFont: WXFontConstant.font12, titleColor: .mainColor, backgroundColor: .clear, cornerRadiusValue: 0, titlePosition: .center, additionalSpacing: 0, state: .normal)
        vCodeButton.addTarget(self, action: #selector(vCodeButtonClick(vcode:)), for: .touchUpInside)
        superView.addSubview(vCodeButton)
        vCodeButton.snp.makeConstraints { (make) in
            make.right.equalTo(-15)
            make.centerY.equalTo(vCodeTitle.snp.centerY)
            make.width.equalTo(60)
        }
        let gainVcodeButton:UIButton = UIButton()
        gainVcodeButton.set(image: nil, title: "下一步", titleFont: WXFontConstant.boldFont14, titleColor: .white, backgroundColor: .mainColor, cornerRadiusValue: 8.0, titlePosition: .center, additionalSpacing: 0, state: .normal)
        gainVcodeButton.addTarget(self, action: #selector(gainVcodeButtonClick), for: .touchUpInside)
        view.addSubview(gainVcodeButton)
        gainVcodeButton.snp.makeConstraints { (make) in
            make.top.equalTo(superView.snp.bottom).offset(20)
            make.width.equalTo(kScreenWidth/1.45)
            make.height.equalTo(38)
            make.centerX.equalTo(kScreenWidth/2)
        }
    }
}
