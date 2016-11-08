//
//  ViewController.swift
//  Weibo_swift
//
//  Created by 李明禄 on 16/9/4.
//  Copyright © 2016年 SocererGroup. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   
    var tableView: UITableView!
    var screen: CGRect!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.screen = UIScreen.mainScreen().bounds
        let tableViewFrame = screen.size
        let tableview = UITableView.init(frame: screen)
        
        self.tableView = tableview
        self.tableView.backgroundColor = UIColor.blueColor()
        
        self.view.addSubview(self.tableView)
        
        for weibo in WeiBoArray {
            print("&^&&&&&&&&&&&&&" + weibo.name)
        }
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    lazy var WeiBoArray: [Weibo] = {
    
        let weibos: [Weibo]
        
        weibos = Weibo.plistToArray()
        
        return weibos
    }()


}

