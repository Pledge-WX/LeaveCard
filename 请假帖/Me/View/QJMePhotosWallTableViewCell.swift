//
//  QJMePhotosWallTableViewCell.swift
//  请假帖
//
//  Created by 王旭 on 2018/1/11.
//  Copyright © 2018年 PledgeWX. All rights reserved.
//
import UIKit

class QJMePhotosWallTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var photoWallCollectionView: UICollectionView!//cell上显示的三照片
    @IBOutlet weak var photosCountLabel: UILabel!//总共张数
    var photosWallImageArr:NSMutableArray!
    override func awakeFromNib() {
        super.awakeFromNib()
        photoWallCollectionView.register(UINib.init(nibName: "QJPhotoWallCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "QJPhotoWallCollectionViewCell")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        photosCountLabel.text = "共\(photosWallImageArr.count)张图片"
    }
    //MARK: - UICollectionViewDelegate,UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QJPhotoWallCollectionViewCell", for: indexPath) as! QJPhotoWallCollectionViewCell
        cell.photoWallImage.image = UIImage(named:photosWallImageArr[indexPath.row] as! String)
        return cell
    }
    //MARK: - UICollectionViewFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: 40, height: 40)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        return UIEdgeInsets(top: 8, left: 5, bottom: 0, right: 5)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        return 0.1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        return 0.1
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
