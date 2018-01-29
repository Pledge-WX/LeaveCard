//
//  WXButtonEdgeInsets.swift
//  请假帖
//
//  Created by 王旭 on 2018/1/18.
//  Copyright © 2018年 PledgeWX. All rights reserved.
//

import UIKit

extension UIButton {
    //MARK: - anImage:要显示的图片 title:要显示的标题 titlePosition:要显示的方向 spacing:图片和文字的间距 state:按钮当前状态
    func set(image anImage: UIImage?, title: String, titleFont: UIFont, titleColor: UIColor, backgroundColor: UIColor, cornerRadiusValue:  CGFloat,
                   titlePosition: UIViewContentMode, additionalSpacing: CGFloat, state: UIControlState){
        imageView?.contentMode = .center
        setImage(anImage, for: state)
        positionLabelRespectToImage(title: title, position: titlePosition, spacing: additionalSpacing)
        titleLabel?.textAlignment = .center
        titleLabel?.contentMode = .center
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadiusValue
        self.layer.masksToBounds = true
        titleLabel?.font = titleFont
        setTitleColor(titleColor, for: .normal)
        setTitle(title, for: state)
    }
    
    private func positionLabelRespectToImage(title: String, position: UIViewContentMode,
                                             spacing: CGFloat) {
        let imageSize = imageRect(forContentRect: frame)
        let titleFont = titleLabel?.font!
        let titleSize = title.size(withAttributes: [NSAttributedStringKey.font: titleFont!])
        var titleInsets: UIEdgeInsets
        var imageInsets: UIEdgeInsets
        switch (position){
        case .top:
            titleInsets = UIEdgeInsets(top: -(imageSize.height + titleSize.height + spacing),
                                       left: -(imageSize.width), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -titleSize.width)
        case .bottom:
            titleInsets = UIEdgeInsets(top: (imageSize.height + titleSize.height + spacing),
                                       left: -(imageSize.width), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: -titleSize.height, left: 0, bottom: 0, right: -titleSize.width+spacing)
        case .left:
            titleInsets = UIEdgeInsets(top: 0, left: -(imageSize.width * 2), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0,
                                       right: -(titleSize.width * 2 + spacing))
        case .right:
            titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -spacing)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        default:
            titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        titleEdgeInsets = titleInsets
        imageEdgeInsets = imageInsets
    }
}
