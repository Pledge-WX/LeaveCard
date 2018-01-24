//
//  QJResetViewController.swift
//  请假帖
//
//  Created by 王旭 on 2018/1/19.
//  Copyright © 2018年 PledgeWX. All rights reserved.
//

import UIKit

class QJResetViewController: QJBeaseViewController {
    var vCodeTextField:UITextField = UITextField()//短信验证码
    var newPassWordTextField:UITextField = UITextField()//新的密码
    var confirmPassWordTextField:UITextField = UITextField()//确认新的密码
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "重置密码"
        creatResetUI()
    }
    func creatResetUI(){//重置密码的UI
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
            let resetTitle:UILabel = UILabel()
            let resetTextField:UITextField = UITextField()
            let lines:UIView = UIView()
            resetTitle.textColor = UIColor.twoTextColor
            resetTitle.textAlignment = .left
            resetTitle.font = WXFontConstant.boldFont13
            let titleHeight = (110/3)
            resetTextField.borderStyle = .none
            resetTextField.clearButtonMode = .always
            resetTextField.textAlignment = .left
            resetTextField.font = WXFontConstant.font13
            superView.addSubview(resetTextField)
            superView.addSubview(resetTitle)
            if i < 1{
                lines.backgroundColor = UIColor.mainColor
                superView.addSubview(lines)
            }
            switch i{
            case 0://新密码
                resetTitle.text = "新密码："
                resetTitle.snp.makeConstraints({ (make) in
                    make.top.equalTo(12)
                    make.left.equalTo(10)
                    make.height.equalTo(25)
                })
                resetTextField.placeholder = "请输入新的密码"
                newPassWordTextField = resetTextField
                break
            case 1://确认密码
                resetTitle.text = "确认新密码："
                resetTitle.snp.makeConstraints({ (make) in
                    make.top.equalTo(22 + titleHeight)
                    make.left.equalTo(10)
                    make.height.equalTo(25)
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
            if i < 1{
                lines.snp.makeConstraints { (make) in
                    make.top.equalTo(resetTitle.snp.bottom).offset(10)
                    make.height.equalTo(0.5)
                    make.left.equalTo(5)
                    make.right.equalTo(-5)
                }
            }
        }
        let confirmPassWordButton:UIButton = UIButton()
        confirmPassWordButton.titleLabel?.font = WXFontConstant.boldFont14
        confirmPassWordButton.layer.cornerRadius = 8.0;
        confirmPassWordButton.layer.masksToBounds = true
        confirmPassWordButton.setTitleColor(UIColor.white, for: .normal)
        confirmPassWordButton.setTitle("重置密码", for: .normal)
        confirmPassWordButton.addTarget(self, action: #selector(confirmPassWordButtonClick), for: .touchUpInside)
        confirmPassWordButton.backgroundColor = UIColor.mainColor
        view.addSubview(confirmPassWordButton)
        confirmPassWordButton.snp.makeConstraints { (make) in
            make.top.equalTo(superView.snp.bottom).offset(20)
            make.width.equalTo(kScreenWidth/1.45)
            make.height.equalTo(38)
            make.centerX.equalTo(kScreenWidth/2)
        }
    }
    @objc func confirmPassWordButtonClick(){//确认修改密码
        print("点击了确认修改密码按钮")
        for vc in (navigationController?.viewControllers)! {
            if vc == loginVc {
                navigationController?.popToViewController(vc, animated: true)
            }
        }
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
