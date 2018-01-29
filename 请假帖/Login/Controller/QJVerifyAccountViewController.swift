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
        //验证手机号的UI
        self.setupVerifyAccountUI()
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
    
}
