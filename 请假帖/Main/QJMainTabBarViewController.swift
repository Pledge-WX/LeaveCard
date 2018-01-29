//
//  QJMainTabBarViewController.swift
//  请假帖
//
//  Created by 王旭 on 2018/1/10.
//  Copyright © 2018年 PledgeWX. All rights reserved.
//

import UIKit
let loginVc = QJLoginViewController()
class QJMainTabBarViewController: UITabBarController,UITabBarControllerDelegate {
    var _lastSelectedIndex: NSInteger!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(againLoginNotification(notification:)), name: NSNotification.Name(rawValue: "klogOutButtonClickNotification"), object: nil)
        addChildViewController(QJHomeViewController(), title: "首页", imageName: "tabbar_home")
        addChildViewController(QJMessageViewController(), title: "消息", imageName: "tabbar_message_center")
        addChildViewController(QJFriendViewController(), title: "成员", imageName: "tabbar_friend")
        addChildViewController(QJMeViewController(), title: "我的", imageName: "tabbar_profile")
        presentLoginVc(isLogOut: false)
    }
    fileprivate func presentLoginVc(isLogOut:Bool){
        guard isLogOut else {//如果条件不成立
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.38) {
                let loginNav = QJNavgationViewController(rootViewController: loginVc)
                loginNav.modalPresentationStyle = .custom
                self.present(loginNav, animated: true, completion: nil)
            }
            return
        }
        let loginNav = QJNavgationViewController(rootViewController: loginVc)
        loginNav.modalPresentationStyle = .custom
        self.present(loginNav, animated: true, completion: nil)
    }
    fileprivate func addChildViewController(_ childVc: UIViewController, title : String, imageName : String) {
        childVc.title = title;
        childVc.tabBarItem = UITabBarItem(title: title, image: UIImage(named: imageName),
                                          selectedImage: UIImage(named: imageName + "_highlighted")?.withRenderingMode(.alwaysOriginal))
        childVc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.normalTextColor], for: .selected)
        //2.包装导航控制器
        let childNav = QJNavgationViewController(rootViewController: childVc)
        //3.添加控制器
        addChildViewController(childNav)
    }
    //MARK: - UITabBarDelegate
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let tabIndex = tabBar.items?.index(of: item)
        if tabIndex != selectedIndex {
            _lastSelectedIndex = selectedIndex
        }
    }
    @objc public func againLoginNotification(notification:Notification){
        presentLoginVc(isLogOut: true)
        if selectedIndex != _lastSelectedIndex {
            selectedIndex = 0
        }
        }
    
    deinit{
        NotificationCenter.default.removeObserver(self)
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
