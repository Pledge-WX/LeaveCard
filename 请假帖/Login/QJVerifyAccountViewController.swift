//
//  QJVerifyAccountViewController.swift
//  请假帖
//
//  Created by 王旭 on 2018/1/19.
//  Copyright © 2018年 PledgeWX. All rights reserved.
//

import UIKit

class QJVerifyAccountViewController: QJBeaseViewController {
    var isRegistType:Bool = true
    var phoneTitle:UILabel = UILabel()//手机号码标题
    var vCodeTitle:UILabel = UILabel()//验证码标题
    var phoneTextField:UITextField = UITextField()//手机号码
    var vCodeTextField:UITextField = UITextField()//验证码
    let vCodeButton:UIButton = UIButton()//显示验证码按钮
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = isRegistType ?  "注册手机号" : "验证手机号"
        creatForgetUI()
    }
    
    func creatForgetUI(){//初始化UI
        let superView:UIView = UIView()//登录的背景View
        superView.backgroundColor = UIColor.white
        superView.layer.cornerRadius = 10
        superView.layer.masksToBounds = true
        view.addSubview(superView)
        superView.snp.makeConstraints { (make) in
            make.centerX.equalTo(kScreenWidth/2)
            make.top.equalTo(76)
            make.width.equalTo(kScreenWidth/superViewWith)
            make.height.equalTo(100)
        }
        for i in 0..<2 {
            let titles:UILabel = UILabel()
            superView.addSubview(titles)
            titles.textColor = UIColor.twoTextColor
            titles.textAlignment = .left
            titles.font = WXFontConstant.boldFont13
            titles.text = i == 0 ? "手机号码：" : "验证码："
            titles.snp.makeConstraints({ (make) in
                if i == 0{
                    phoneTitle = titles
                    make.left.equalTo(10)
                    make.top.equalTo(15)
                    make.height.equalTo(25)
                }else{
                    vCodeTitle = titles
                    make.left.equalTo(10)
                    make.bottom.equalTo(-15)
                    make.height.equalTo(25)
                }
            })
        }
        //MARK: - 设置验证码按钮
        vCodeButton.setTitleColor(UIColor.mainColor, for: .normal)
        vCodeButton.titleLabel?.font = WXFontConstant.font12
        vCodeButton.backgroundColor = UIColor.clear
        vCodeButton.setTitle("获取验证码", for: .normal)
        vCodeButton.addTarget(self, action: #selector(vCodeButtonClick(vcode:)), for: .touchUpInside)
        superView.addSubview(vCodeButton)
        vCodeButton.snp.makeConstraints { (make) in
            make.right.equalTo(-5)
            make.centerY.equalTo(vCodeTitle.snp.centerY)
            make.width.equalTo(60)
        }
        //MARK: - 设置俩个输入框
        for j in 0..<2 {
            let textField:UITextField = UITextField()
            superView.addSubview(textField)
            textField.borderStyle = .none
            textField.clearButtonMode = .always
            textField.textAlignment = .left
            textField.font = WXFontConstant.font13
            textField.placeholder = j == 0 ? "请输入手机号码":"请输入验证码"
            textField.snp.makeConstraints({ (make) in
                if j == 0{
                    phoneTextField = textField
                    make.centerY.equalTo(phoneTitle.snp.centerY)
                    make.left.equalTo(phoneTitle.snp.right).offset(0)
                    make.right.equalTo(superView.snp.right).offset(-10)
                    make.height.equalTo(phoneTitle.snp.height).offset(0)
                }else{
                    textField.isSecureTextEntry = true
                    vCodeTextField = textField
                    make.centerY.equalTo(vCodeTitle.snp.centerY)
                    make.left.equalTo(vCodeTitle.snp.right).offset(13)
                    make.right.equalTo(superView.snp.right).offset(-80)
                    make.height.equalTo(vCodeTitle.snp.height).offset(0)
                }
            })
        }
        //MARK: - 设置俩个横线
        let lineView:UIView = UIView()
        lineView.backgroundColor = UIColor.mainColor
        superView.addSubview(lineView)
        lineView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.height.equalTo(0.5)
            make.left.equalTo(5)
            make.right.equalTo(-5)
        }
        let gainVcodeButton:UIButton = UIButton()
        gainVcodeButton.titleLabel?.font = WXFontConstant.boldFont14
        gainVcodeButton.layer.cornerRadius = 8.0;
        gainVcodeButton.layer.masksToBounds = true
        gainVcodeButton.setTitleColor(UIColor.white, for: .normal)
        gainVcodeButton.setTitle("下一步", for: .normal)
        gainVcodeButton.addTarget(self, action: #selector(gainVcodeButtonClick), for: .touchUpInside)
        gainVcodeButton.backgroundColor = UIColor.mainColor
        view.addSubview(gainVcodeButton)
        gainVcodeButton.snp.makeConstraints { (make) in
            make.top.equalTo(superView.snp.bottom).offset(20)
            make.width.equalTo(kScreenWidth/1.45)
            make.height.equalTo(38)
            make.centerX.equalTo(kScreenWidth/2)
        }
    }
    @objc func gainVcodeButtonClick(){//
        print("点击了获取短信验证码按钮")
        guard isRegistType else {
            navigationController?.pushViewController(QJResetViewController(), animated: true)
            return
        }
        navigationController?.pushViewController(QJRegistViewController(), animated: true)
    }
    @objc func vCodeButtonClick(vcode:UIButton){//更新验证码
        print("点击了更新验证码")
        vCodeButton.setTitle("倒计时中", for: .normal)
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
