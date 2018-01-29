//
//  QJLoginViewController+Extension.swift
//  请假帖
//
//  Created by 王旭 on 2018/1/26.
//  Copyright © 2018年 PledgeWX. All rights reserved.
//

import UIKit
import Foundation

extension QJLoginViewController{
    func setupLoginUI() -> Void {
        creatLoginUI()
        creatOhterLoginUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    fileprivate func creatLoginUI() {//初始化UI
        let iconImageView:UIImageView = UIImageView()
        iconImageView.image = UIImage(named: "icon")
        view.addSubview(iconImageView)
        iconImageView.snp.makeConstraints { (make) in
            make.top.equalTo(kScreenHeight*0.12)
            make.width.height.equalTo(120)
            make.centerX.equalTo(kScreenWidth/2)
        }
        let superView:UIView = UIView()//登录的背景View
        superView.backgroundColor = UIColor.clear
        view.addSubview(superView)
        superView.snp.makeConstraints { (make) in
            make.centerX.equalTo(kScreenWidth/2)
            make.centerY.equalTo(kScreenHeight*0.44)
            make.width.equalTo(kScreenWidth/1.52)
            make.height.equalTo(80)
        }
        //MARK: - 设置俩个输入框
        for j in 0..<2 {
            let userView:UIView = UIView()
            superView.addSubview(userView)
            userView.backgroundColor = UIColor.blue
            userView.creatLoginView()
            userView.snp.makeConstraints({ (make) in
                make.left.equalTo(5)
                if j == 0{
                    make.top.equalTo(0)
                }else{
                    make.top.equalTo((70/2)+5)
                }
                make.right.equalTo(-5)
                make.height.equalTo(70/2)
            })
            let titleImage:UIImageView = UIImageView()
            titleImage.image = UIImage(named: j == 0 ? "nameIcon" : "passWordIcon")!
            userView.addSubview(titleImage)
            titleImage.snp.makeConstraints { (make) in
                make.left.equalTo(10)
                make.centerY.equalTo((70/2)/2)
            }
            let textFeild:UITextField = UITextField()
            textFeild.placeholder = j == 0 ? "请输入用户名" : "请输入密码"
            textFeild.clearButtonMode = .always
            textFeild.textColor = UIColor.black
            textFeild.textAlignment = .left
            textFeild.tintColor = UIColor.mainColor
            textFeild.delegate = self
            textFeild.font = WXFontConstant.boldFont13
            textFeild.isSecureTextEntry =  j == 0 ? false : true
            userView.addSubview(textFeild)
            textFeild.tag = j
            textFeild.snp.makeConstraints { (make) in
                make.left.equalTo(titleImage.snp.right).offset(10)
                make.top.bottom.equalTo(0)
                make.right.equalTo(-5)
            }
            if j == 0 {
                self.userNameTextField = textFeild
            }else{
                self.passWordTextField = textFeild
            }
        }
        for b in 0...2 {
            let button:UIButton = UIButton()
            view.addSubview(button)
            switch b{
            case 0:
                button.snp.makeConstraints { (make) in
                    make.centerX.equalTo(kScreenWidth/2)
                    make.top.equalTo(superView.snp.bottom).offset(20)
                    make.width.equalTo(kScreenWidth/1.51)
                    make.height.equalTo(35)
                }
                button.set(image: nil, title: "登录", titleFont: WXFontConstant.boldFont14, titleColor: .white, backgroundColor: UIColor.mainColor, cornerRadiusValue: 8.0, titlePosition: .center, additionalSpacing: 0, state: .normal)
                button.addTarget(self, action:#selector(loginButtonClick(button:)), for: .touchUpInside)
                loginButton = button
                break;
            case 1:
                button.snp.makeConstraints { (make) in
                    make.top.equalTo(loginButton.snp.bottom).offset(5)
                    make.left.equalTo(loginButton.snp.left).offset(0)
                    make.height.equalTo(30)
                }
                button.set(image: nil, title: "忘记密码?", titleFont: WXFontConstant.font12, titleColor: UIColor.mainColor, backgroundColor: .clear, cornerRadiusValue: 0, titlePosition: .center, additionalSpacing: 0, state: .normal)
                button.addTarget(self, action:#selector(forgetButtonClick(button:)), for: .touchUpInside)
                forgetPassWordButton = button
                break;
            case 2:
                button.snp.makeConstraints { (make) in
                    make.top.equalTo(self.loginButton.snp.bottom).offset(5)
                    make.right.equalTo(self.loginButton.snp.right).offset(0)
                    make.height.equalTo(30)
                }
                button.set(image: nil, title: "立即注册", titleFont: WXFontConstant.font12, titleColor: UIColor.mainColor, backgroundColor: .clear, cornerRadiusValue: 0, titlePosition: .center, additionalSpacing: 0, state: .normal)
                button.addTarget(self, action:#selector(registerButtonClick(button:)), for: .touchUpInside)
                registerButton = button
                break;
            default:
                break;
            }
        }
    }
    fileprivate func creatOhterLoginUI(){//初始化第三方登录UI
        let otherTitle:UILabel = UILabel()
        view.addSubview(otherTitle)
        otherTitle.text = "第三方登录"
        otherTitle.font = WXFontConstant.font13
        otherTitle.backgroundColor = UIColor.clear
        otherTitle.textAlignment = .center
        otherTitle.textColor = UIColor.threeTextColor
        otherTitle.snp.makeConstraints { (make) in
            make.centerX.equalTo(kScreenWidth/2)
            make.top.equalTo(self.registerButton.snp.bottom).offset(30)
            make.height.equalTo(25)
            make.width.equalTo(70)
        }
        for l in 0..<2 {
            let lineView:UIView = UIView()
            lineView.backgroundColor = UIColor.grayLineColor
            view.addSubview(lineView)
            lineView.snp.makeConstraints { (make) in
                if l == 0{
                    make.centerY.equalTo(otherTitle.snp.centerY)
                    make.height.equalTo(0.5)
                    make.left.equalTo(5)
                    make.right.equalTo(otherTitle.snp.left).offset(-5)
                }else{
                    make.centerY.equalTo(otherTitle.snp.centerY)
                    make.height.equalTo(0.5)
                    make.left.equalTo(otherTitle.snp.right).offset(5)
                    make.right.equalTo(-5)
                }
            }
        }
        for b in 0...2 {
            let button:UIButton = UIButton()
            let manger = 15
            let buttonWith = ((Int)(kScreenWidth) - (manger*4))/3
            view.addSubview(button)
            button.titleLabel?.font = WXFontConstant.boldFont13
            
            button.snp.makeConstraints { (make) in
                make.top.equalTo(self.registerButton.snp.bottom).offset(85)
                make.width.equalTo(buttonWith)
                make.height.equalTo(buttonWith)
                make.left.equalTo((manger + (buttonWith * b) + (manger * b)))
            }
            switch b{
            case 0:
                button.set(image: UIImage(named: "wx_icon"), title: "微信登录", titleFont: WXFontConstant.font12, titleColor: UIColor.threeTextColor, backgroundColor: .clear, cornerRadiusValue: 0, titlePosition: .bottom, additionalSpacing: 5, state: .normal)
                button.addTarget(self, action:#selector(wxLoginButtonClick(button:)), for: .touchUpInside)
                loginButton = button
                break;
            case 1:
                button.set(image: UIImage(named: "qq_icon"), title: "QQ登录", titleFont: WXFontConstant.font12, titleColor: UIColor.threeTextColor, backgroundColor: .clear, cornerRadiusValue: 0, titlePosition: .bottom, additionalSpacing: 5, state: .normal)
                button.addTarget(self, action:#selector(qqLoginButtonClick(button:)), for: .touchUpInside)
                forgetPassWordButton = button
                break;
            case 2:
                button.set(image: UIImage(named: "wb_icon"), title: "微博登录", titleFont: WXFontConstant.font12, titleColor: UIColor.threeTextColor, backgroundColor: .clear, cornerRadiusValue: 0, titlePosition: .bottom, additionalSpacing: 5, state: .normal)
                button.addTarget(self, action:#selector(wbLoginButtonClick(button:)), for: .touchUpInside)
                registerButton = button
                break;
            default:
                break;
            }
        }
        
    }
}
