//
//  QJMeHeaderTableViewCell.swift
//  请假帖
//
//  Created by 王旭 on 2018/1/11.
//  Copyright © 2018年 PledgeWX. All rights reserved.
//

import UIKit

typealias AddBlock = (_ headIcon: UIImage)->Void//声明一个block
class QJMeHeaderTableViewCell: UITableViewCell {
    @IBOutlet weak var hearderIconImageView: UIButton!
    var completeActionSheetFunc: AddBlock?
    func complets(completeActionSheetFunc: AddBlock?){
        self.completeActionSheetFunc = completeActionSheetFunc
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func headerButtonClick(_ sender: Any) {
        completeActionSheetFunc!((hearderIconImageView.imageView?.image)!)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
