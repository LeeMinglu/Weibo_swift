//
//  weibo.swift
//  Weibo_swift
//
//  Created by 李明禄 on 16/9/5.
//  Copyright © 2016年 SocererGroup. All rights reserved.
//

import UIKit

class Weibo: Reflect {
    
    var text: String
    var icon: String
    var name: String
    var picture: String
    var vip: Bool
    
    required init() {
        self.text = ""
        self.icon = ""
        self.name = ""
        self.picture = ""
        self.vip = false
    }
    
    class func plistToArray() -> [Weibo] {
        let path = NSBundle.mainBundle().pathForResource("weibos.plist", ofType: nil)
        
        let PlistArray = NSArray(contentsOfFile: path!)
        
        var modelArray: [Weibo] = []
        
        for weibo in PlistArray! {
            let weiboModel = Weibo.parse(dict: weibo as! NSDictionary)
            
            modelArray.append(weiboModel)
        }
        return modelArray
  
    }
    
    

}
