//
//  QJHeadIconViewController.swift
//  请假帖
//
//  Created by 王旭 on 2018/1/12.
//  Copyright © 2018年 PledgeWX. All rights reserved.
//

import UIKit

class QJHeadIconViewController: QJBeaseViewController {
    var iconImage = UIImage()
    var iconImageView:UIImageView? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "查看头像"
        iconImageView?.contentMode = UIViewContentMode.scaleAspectFill;
        iconImageView = UIImageView.init(image: iconImage)
        view.addSubview(iconImageView!)
        iconImageView?.snp.makeConstraints({ (make) in
            make.top.equalTo((navigationController?.navigationBar.frame.size.height)!+25)
            make.centerX.equalTo(kScreenWidth/2)
        })
    }
    override func viewWillDisappear(_ animated: Bool) {
        iconImageView?.alpha = 0
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("销毁了")
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
