//
//  QJMeViewController.swift
//  请假帖
//
//  Created by 王旭 on 2018/1/10.
//  Copyright © 2018年 PledgeWX. All rights reserved.
//
import UIKit
enum MeCellType : Int{//我的界面cell的类型
    case meCellTypeHeader = 0,      //头部头像
         meCellTypePhotoWall,   //照片墙
         meCellTypeSex,         //性别
         meCellTypeBirthday,    //生日
         meCellTypeSite,        //地址
         meCellTypeContact,     //联系方式
         meCellTypeTeam,        //团队
         meCellTypeSignature    //个性签名
}
import SnapKit
class QJMeViewController: QJBeaseViewController,UITableViewDelegate,UITableViewDataSource {
    let meTableView:UITableView = UITableView()
    let meCount:NSInteger = 9   //总共cell个数
    let photoCellHeight:CGFloat = 45    //公用Cell的高度
    var photosWallImageMutbArr:NSArray = ["a_1","a_2","a_3","a_4","a_5","a_6"]
    var meTitleArr = ["性别:","生日:","所在地:","联系方式:","我的团队:","个人签名:"]
    let meDescArr = ["男","09-05","湖南省-长沙市","15273237663","MobilenowGroup","努力到无能为力,拼搏到感动自己"]
    override func viewDidLoad() {
        super.viewDidLoad()
        creatMeTableView()
    }
    //MARK: 初始化UI
    fileprivate func creatMeTableView(){
        view.addSubview(meTableView)
        meTableView.register(UINib.init(nibName: "QJMeHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "QJMeHeaderTableViewCell")
        meTableView.register(UINib.init(nibName: "QJMePhotosWallTableViewCell", bundle: nil), forCellReuseIdentifier: "QJMePhotosWallTableViewCell")
        meTableView.register(UINib.init(nibName: "QJMeMessageTableViewCell", bundle: nil), forCellReuseIdentifier: "QJMeMessageTableViewCell")
        meTableView.register(UINib.init(nibName: "QJLogOutTableViewCell", bundle: nil), forCellReuseIdentifier: "QJLogOutTableViewCell")
        meTableView.showsVerticalScrollIndicator = false
        meTableView.showsHorizontalScrollIndicator = false
        meTableView.backgroundColor = UIColor.clear
        meTableView.delegate = self
        meTableView.dataSource = self
        meTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        meTableView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
    }
    
    //MARK: - UITableViewDelegate,UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meCount
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        let indexPathRow = indexPath.row
        if indexPathRow == MeCellType.meCellTypeHeader.rawValue    {
            let MeHeaderCell : QJMeHeaderTableViewCell = tableView.dequeueReusableCell(withIdentifier: "QJMeHeaderTableViewCell", for: indexPath) as! QJMeHeaderTableViewCell
            MeHeaderCell.complets(completeActionSheetFunc: { (icon) in
                let headIconVc = QJHeadIconViewController()
                headIconVc.iconImage = icon
                self.navigationController?.pushViewController(headIconVc, animated: true)
            })
            cell = MeHeaderCell
        }else if indexPathRow == MeCellType.meCellTypePhotoWall.rawValue {
            let MePhotosCell : QJMePhotosWallTableViewCell = tableView.dequeueReusableCell(withIdentifier: "QJMePhotosWallTableViewCell", for: indexPath) as! QJMePhotosWallTableViewCell
            MePhotosCell.photosWallImageArr = NSMutableArray(array: photosWallImageMutbArr)
            cell = MePhotosCell
        }else{
            if indexPathRow == meCount-1{
                let logOutCell = tableView.dequeueReusableCell(withIdentifier: "QJLogOutTableViewCell", for: indexPath)as!QJLogOutTableViewCell
                logOutCell.logOutComplets(logOutBlock: {(logOutString) in
                    print(logOutString)
                    let logOutAlertVc = UIAlertController(title: "确认退出吗?", message: nil, preferredStyle: .alert)
                    let cancel = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel) { (cancel) in
                    }
                    let confirm = UIAlertAction(title: "确认", style: UIAlertActionStyle.destructive) { (confirm) in
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "klogOutButtonClickNotification"), object: nil)
                    }
                    logOutAlertVc.addAction(cancel)
                    logOutAlertVc.addAction(confirm)
                    DispatchQueue.main.async(execute: {
                        self.present(logOutAlertVc, animated: true, completion: nil)
                    })
                    
                })
                cell = logOutCell
            }else{
                let MeMessageCell : QJMeMessageTableViewCell = tableView.dequeueReusableCell(withIdentifier: "QJMeMessageTableViewCell", for: indexPath) as! QJMeMessageTableViewCell
                MeMessageCell.meTitleLabel.text = "\(meTitleArr[indexPathRow-2])"
                MeMessageCell.meDescLabel.text = "\(meDescArr[indexPathRow-2])"
                cell = MeMessageCell
            }
        }
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let indexPathRow = indexPath.row
        if indexPathRow == 0 {
            return 110
        }else if indexPathRow == 1{
            return photoCellHeight + 12
        }else if indexPathRow == meCount-1{
            return 100
        }
        return photoCellHeight
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
