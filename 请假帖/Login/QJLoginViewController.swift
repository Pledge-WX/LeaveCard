//
//  QJLoginViewController.swift
//  请假帖
//
//  Created by 王旭 on 2018/1/18.
//  Copyright © 2018年 PledgeWX. All rights reserved.
//

import UIKit
let superViewWith:CGFloat = 1.18

class QJLoginViewController: QJBeaseViewController {
    var userNameTextField:UITextField = UITextField()//用户名
    var passWordTextField:UITextField = UITextField()//密码
    var userTitle:UILabel = UILabel()//用户名标题
    var passwordTitle:UILabel = UILabel()//密码标题
    var loginButton:UIButton = UIButton()//登录按钮
    var registerButton:UIButton = UIButton()//注册按钮
    var forgetPassWordButton:UIButton = UIButton()//忘记密码
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    let superView:UIView = UIView()//登录的背景View
    superView.backgroundColor = UIColor.white
    superView.layer.cornerRadius = 10
    superView.layer.masksToBounds = true
    view.addSubview(superView)
    superView.snp.makeConstraints { (make) in
        make.centerX.equalTo(kScreenWidth/2)
        make.centerY.equalTo(kScreenHeight*0.28)
        make.width.equalTo(kScreenWidth/superViewWith)
        make.height.equalTo(100)
    }
    //MARK: - 设置俩个title
    for i in 0..<2 {
        let titles:UILabel = UILabel()
        superView.addSubview(titles)
        titles.textColor = UIColor.twoTextColor
        titles.textAlignment = .left
        titles.font = WXFontConstant.boldFont13
        titles.text = i == 0 ? "用户名：" : "密码："
        titles.snp.makeConstraints({ (make) in
            if i == 0{
                userTitle = titles
                make.left.equalTo(15)
                make.top.equalTo(14)
                make.height.equalTo(25)
            }else{
                passwordTitle = titles
                make.left.equalTo(15)
                make.bottom.equalTo(-14)
                make.height.equalTo(25)
            }
        })
    }
    //MARK: - 设置俩个输入框
    for j in 0..<2 {
        let textField:UITextField = UITextField()
        superView.addSubview(textField)
        textField.borderStyle = .none
        textField.clearButtonMode = .always
        textField.textAlignment = .left
        textField.font = WXFontConstant.font13
        textField.placeholder = j == 0 ? "请输入用户名":"请输入密码"
        textField.snp.makeConstraints({ (make) in
            if j == 0{
                userNameTextField = textField
                make.centerY.equalTo(userTitle.snp.centerY)
                make.left.equalTo(userTitle.snp.right).offset(0)
                make.right.equalTo(superView.snp.right).offset(-10)
                make.height.equalTo(userTitle.snp.height).offset(0)
            }else{
                textField.isSecureTextEntry = true
                passWordTextField = textField
                make.centerY.equalTo(passwordTitle.snp.centerY)
                make.left.equalTo(passwordTitle.snp.right).offset(13)
                make.right.equalTo(superView.snp.right).offset(-10)
                make.height.equalTo(passwordTitle.snp.height).offset(0)
            }
        })
    }
    //MARK: - 设置俩个横线
    for l in 0..<1 {
        let lineView:UIView = UIView()
        lineView.backgroundColor = UIColor.mainColor
        superView.addSubview(lineView)
        lineView.snp.makeConstraints { (make) in
            if l == 0{
                make.center.equalToSuperview()
                make.height.equalTo(0.5)
                make.left.equalTo(5)
                make.right.equalTo(-5)
            }else{
                make.top.equalTo(passWordTextField.snp.bottom).offset(10)
                make.height.equalTo(0.5)
                make.left.equalTo(10)
                make.right.equalTo(-10)
            }
        }
    }
    for b in 0...2 {
    let button:UIButton = UIButton()
    view.addSubview(button)
        switch b{
        case 0:
            button.backgroundColor = UIColor.mainColor
            button.setTitle("登录", for: .normal)
            button.setTitleColor(UIColor.white, for: .normal)
            button.titleLabel?.font = WXFontConstant.boldFont14
            button.layer.cornerRadius = 8.0;
            button.layer.masksToBounds = true
            button.addTarget(self, action:#selector(loginButtonClick(button:)), for: .touchUpInside)
            button.snp.makeConstraints { (make) in
                make.centerX.equalTo(kScreenWidth/2)
                make.top.equalTo(superView.snp.bottom).offset(20)
                make.width.equalTo(kScreenWidth/1.45)
                make.height.equalTo(38)
            }
            loginButton = button
            break;
        case 1:
            button.setTitleColor(UIColor.mainColor, for: .normal)
            button.setTitle("忘记密码?", for: .normal)
            button.titleLabel?.font = WXFontConstant.font12
            button.addTarget(self, action:#selector(forgetButtonClick(button:)), for: .touchUpInside)
            button.snp.makeConstraints { (make) in
                make.top.equalTo(loginButton.snp.bottom).offset(5)
                make.left.equalTo(loginButton.snp.left).offset(0)
                make.height.equalTo(30)
            }
            forgetPassWordButton = button
            break;
        case 2:
            button.setTitleColor(UIColor.mainColor, for: .normal)
            button.setTitle("立即注册", for: .normal)
            button.titleLabel?.font = WXFontConstant.font12
            button.addTarget(self, action:#selector(registerButtonClick(button:)), for: .touchUpInside)
            button.snp.makeConstraints { (make) in
                make.top.equalTo(loginButton.snp.bottom).offset(5)
                make.right.equalTo(loginButton.snp.right).offset(0)
                make.height.equalTo(30)
            }
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
            make.top.equalTo(registerButton.snp.bottom).offset(30)
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
                make.top.equalTo(registerButton.snp.bottom).offset(85)
                make.width.equalTo(buttonWith)
                make.height.equalTo(buttonWith)
                make.left.equalTo((manger + (buttonWith * b) + (manger * b)))
            }
            switch b{
            case 0:
                button.set(image: UIImage(named: "wx_icon"), title: "微信登录", titlePosition: .bottom, additionalSpacing: 15, state: .normal)
                button.addTarget(self, action:#selector(wxLoginButtonClick(button:)), for: .touchUpInside)
                loginButton = button
                break;
            case 1:
                button.set(image: UIImage(named: "qq_icon"), title: "QQ登录", titlePosition: .bottom, additionalSpacing: 15, state: .normal)
                button.addTarget(self, action:#selector(qqLoginButtonClick(button:)), for: .touchUpInside)
                forgetPassWordButton = button
                break;
            case 2:
                button.set(image: UIImage(named: "wb_icon"), title: "微博登录", titlePosition: .bottom, additionalSpacing: 15, state: .normal)
                button.addTarget(self, action:#selector(wbLoginButtonClick(button:)), for: .touchUpInside)
                registerButton = button
                break;
            default:
                break;
            }
        }
        
    }

    @objc func loginButtonClick(button:UIButton?){
        print("点击了登录按钮")
        dismiss(animated: true, completion: nil)
    }
    @objc func forgetButtonClick(button:UIButton?){
        print("点击了忘记密码")
        let  verifyVc = QJVerifyAccountViewController()
            verifyVc.isRegistType = false //验证手机号
        navigationController?.pushViewController(verifyVc, animated: true)
    }
    @objc func registerButtonClick(button:UIButton?){
        print("点击了立即注册")
        let  verifyVc = QJVerifyAccountViewController()
        verifyVc.isRegistType = true //注册手机号
        navigationController?.pushViewController(verifyVc, animated: true)
    }
    @objc func wxLoginButtonClick(button:UIButton?){
        print("点击了微信授权登录")
    }
    @objc func qqLoginButtonClick(button:UIButton?){
        print("点击了QQ授权登录")
    }
    @objc func wbLoginButtonClick(button:UIButton?){
        print("点击了微博授权登录")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
