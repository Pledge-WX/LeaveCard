//
//  QJLoginViewController.swift
//  请假帖
//
//  Created by 王旭 on 2018/1/18.
//  Copyright © 2018年 PledgeWX. All rights reserved.
//

import UIKit
let superViewWith:CGFloat = 1.18

class QJLoginViewController: QJBeaseViewController,UITextFieldDelegate {
    var userNameTextField:UITextField = UITextField()//用户名
    var passWordTextField:UITextField = UITextField()//密码
    var loginButton:UIButton = UIButton()//登录按钮
    var registerButton:UIButton = UIButton()//注册按钮
    var forgetPassWordButton:UIButton = UIButton()//忘记密码
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //初始化UI
        self.setupLoginUI()
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
    
    //MARK: - textFeildDelegate
    // 该方法代表输入框已经可以开始编辑  进入编辑状态
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("我正在编辑状态中...\(textField.tag == 1 ? "用户名" : "密码")")
    }
    // 输入框将要将要结束编辑
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("我即将编辑结束...")
        return true
    }
    // 输入框结束编辑状态
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("我已经结束编辑状态...")
    } // 文本框是否可以清除内容
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    // 输入框按下键盘 return 收回键盘
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    // 该方法当文本框内容出现变化时 及时获取文本最新内容
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(string,textField.text ?? "")
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
