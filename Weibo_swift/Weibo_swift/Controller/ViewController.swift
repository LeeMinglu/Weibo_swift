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
    var weiboModel: [Weibo]!
    let indentifier = "weibo"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.screen = UIScreen.mainScreen().bounds
       
        let tableview = UITableView.init(frame: screen)
        
        self.tableView = tableview
        self.tableView.backgroundColor = UIColor.blueColor()
        
        self.view.addSubview(self.tableView)
        
        self.tableView.registerClass(UITableViewCell.in, forCellReuseIdentifier: indentifier)
        
        self.weiboModel = WeiBoArray
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
        return self.weiboModel.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let weibo = self.weiboModel[indexPath.row]
         print("&^&&&&&&&&&&&&&" + weibo.name)
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //懒加载模型数据
    lazy var WeiBoArray: [Weibo] = {
    
        let weibos: [Weibo]
        
        weibos = Weibo.plistToArray()
        
        return weibos
    }()


}

