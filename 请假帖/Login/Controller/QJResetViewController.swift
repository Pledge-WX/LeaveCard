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
        //初始化UI
        self.setupResetVCUI()
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
