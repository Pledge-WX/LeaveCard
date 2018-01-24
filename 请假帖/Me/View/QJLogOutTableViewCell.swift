//
//  QJLogOutTableViewCell.swift
//  请假帖
//
//  Created by 王旭 on 2018/1/12.
//  Copyright © 2018年 PledgeWX. All rights reserved.
//
typealias addLogOutBlock = (_ userName:NSString) ->Void
import UIKit

class QJLogOutTableViewCell: UITableViewCell {
    var completeActionSheetFunc: addLogOutBlock?
    func logOutComplets(logOutBlock: addLogOutBlock?){
        self.completeActionSheetFunc = logOutBlock
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @IBAction func logOutButtonClick(_ sender: UIButton) {
        completeActionSheetFunc!(("确认登出吗？"))
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
