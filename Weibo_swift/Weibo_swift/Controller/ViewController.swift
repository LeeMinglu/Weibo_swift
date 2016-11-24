//
//  ViewController.swift
//  Weibo_swift
//
//  Created by 李明禄 on 16/9/4.
//  Copyright © 2016年 SocererGroup. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    
   
    var tableView: UITableView!
    var screen: CGRect!
    var weiboFrames: [LSWeiboFrame]!
    let indentifier = "weibo"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.screen = UIScreen.mainScreen().bounds
       
        let tableview = UITableView.init(frame: screen)
        
        self.tableView = tableview
        self.tableView.rowHeight = 200
//        self.tableView.backgroundColor = UIColor.blueColor()
        
        self.view.addSubview(self.tableView)
        
        self.tableView.registerClass(LSWeiboCell.self, forCellReuseIdentifier: indentifier)
        
        self.weiboFrames = WeiBoFramesArray
        
        //遵守协议
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
//
//        for weibo in WeiBoArray {
//            print("&^&&&&&&&&&&&&&" + weibo.name)
//        }
       
    }
    
    // MARK: ----TABLEVIEW DELEGATE METHORD-----
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weiboFrames.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        /*
        let cell = tableView.dequeueReusableCellWithIdentifier(indentifier, forIndexPath: indexPath) as! LSWeiboCell
 */
        let cell = LSWeiboCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: indentifier)
        let weiboFrame = self.weiboFrames[indexPath.row]
        let weibo = weiboFrame.weibo
//         print("&^&&&&&&&&&&&&&" + weiboFrame.weibo.name)
        cell.weiboFrame = weiboFrame
        
        
        

        
        print("%%%%%%" + weibo.name + "\(CGRectGetMaxX(weiboFrame.iconFrame))" + "\(CGRectGetMaxX(weiboFrame.iconFrame))")
        
        
        return cell
        
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let frame = self.weiboFrames[indexPath.row]
        print("\(frame.weibo.name)" + "的高度是" + "\(frame.picFrame?.height)")
        return frame.cellHeight
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //懒加载模型数据
    lazy var WeiBoFramesArray: [LSWeiboFrame] = {
    
        let weibos: [Weibo]
        
        weibos = Weibo.plistToArray()
        
        var weiboFrames: [LSWeiboFrame] = []
        for weibo in weibos {
            let weiboFrame = LSWeiboFrame.init()
            weiboFrame.weibo = weibo
            weiboFrames.append(weiboFrame)
        }
        
        
        return weiboFrames
    }()


}

