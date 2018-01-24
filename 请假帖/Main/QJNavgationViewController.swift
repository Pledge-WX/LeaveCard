//
//  QJNavgationViewController.swift
//  请假帖
//
//  Created by 王旭 on 2018/1/10.
//  Copyright © 2018年 PledgeWX. All rights reserved.
//

import UIKit

class QJNavgationViewController: UINavigationController,UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.barTintColor = UIColor.mainColor
        navigationBar.titleTextAttributes =
            [NSAttributedStringKey.foregroundColor: UIColor.white,NSAttributedStringKey.font: WXFontConstant.boldFont15]
    }
    override func pushViewController(_ viewController:UIViewController, animated:Bool) {
        viewController.navigationItem.hidesBackButton=true
        if childViewControllers.count>0{
        UINavigationBar.appearance().backItem?.hidesBackButton=false
        let backButton = UIButton(type: .custom)
        backButton.setImage(#imageLiteral(resourceName: "navBack"), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonClick), for: .touchUpInside)
        let backView = UIBarButtonItem(customView: backButton)
        viewController.navigationItem.leftBarButtonItem = backView
        viewController.hidesBottomBarWhenPushed=true
        }
        super.pushViewController(viewController, animated: animated)
    }
    @objc func backButtonClick(){
        popViewController(animated: true)
        print("返回了")
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
