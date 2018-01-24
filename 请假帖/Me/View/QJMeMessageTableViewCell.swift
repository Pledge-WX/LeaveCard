//
//  QJMeMessageTableViewCell.swift
//  请假帖
//
//  Created by 王旭 on 2018/1/12.
//  Copyright © 2018年 PledgeWX. All rights reserved.
//

import UIKit

class QJMeMessageTableViewCell: UITableViewCell {
    @IBOutlet weak var meTitleLabel: UILabel!
    @IBOutlet weak var meDescLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
