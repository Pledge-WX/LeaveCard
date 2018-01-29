//
//  QJResetViewController+Extension.swift
//  请假帖
//
//  Created by 王旭 on 2018/1/29.
//  Copyright © 2018年 PledgeWX. All rights reserved.
//

import Foundation
import UIKit

extension QJResetViewController{
    func setupResetVCUI(){
        let superView:UIView = UIView()//登录的背景View
        view.addSubview(superView)
        superView.createSuperView()
        //MARK: - 设置横线
        let lineView:UIView = UIView()
        superView.addSubview(lineView)
        lineView.createLineView()
        for i in 0..<2 {
            let resetTitle:UILabel = UILabel()
            let resetTextField:UITextField = UITextField()
            resetTitle.textColor = UIColor.twoTextColor
            resetTitle.textAlignment = .left
            resetTitle.font = WXFontConstant.boldFont13
            resetTextField.borderStyle = .none
            resetTextField.clearButtonMode = .always
            resetTextField.textAlignment = .left
            resetTextField.font = WXFontConstant.font13
            superView.addSubview(resetTextField)
            superView.addSubview(resetTitle)
            switch i{
            case 0://新密码
                resetTitle.text = "新密码："
                resetTitle.snp.makeConstraints({ (make) in
                    make.top.equalTo(superView.snp.top)
                    make.left.equalTo(15)
                    make.bottom.equalTo(lineView.snp.top)
                })
                resetTextField.placeholder = "请输入新的密码"
                newPassWordTextField = resetTextField
                break
            case 1://确认密码
                resetTitle.text = "确认新密码："
                resetTitle.snp.makeConstraints({ (make) in
                    make.top.equalTo(lineView.snp.bottom)
                    make.left.equalTo(15)
                    make.bottom.equalTo(superView.snp.bottom)
                })
                resetTextField.placeholder = "请核对新的密码"
                confirmPassWordTextField = resetTextField
                break
            default:
                break
            }
            resetTextField.snp.makeConstraints({ (make) in
                make.centerY.equalTo(resetTitle.snp.centerY)
                make.left.equalTo(resetTitle.snp.right).offset(0)
                make.right.equalTo(superView.snp.right).offset(-10)
                make.height.equalTo(resetTitle.snp.height).offset(0)
            })
        }
        let confirmPassWordButton:UIButton = UIButton()
        confirmPassWordButton.set(image: nil, title: "重置密码", titleFont: WXFontConstant.boldFont14, titleColor: .white, backgroundColor: .mainColor, cornerRadiusValue: 8.0, titlePosition: .center, additionalSpacing: 0, state: .normal)
        confirmPassWordButton.addTarget(self, action: #selector(confirmPassWordButtonClick), for: .touchUpInside)
        view.addSubview(confirmPassWordButton)
        confirmPassWordButton.snp.makeConstraints { (make) in
            make.top.equalTo(superView.snp.bottom).offset(20)
            make.width.equalTo(kScreenWidth/1.45)
            make.height.equalTo(38)
            make.centerX.equalTo(kScreenWidth/2)
        }
    }
}
