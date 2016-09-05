//
//  ViewController.swift
//  Weibo_swift
//
//  Created by 李明禄 on 16/9/4.
//  Copyright © 2016年 SocererGroup. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   
//    let tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for weibo in WeiBoArray {
            print(weibo.name)
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

