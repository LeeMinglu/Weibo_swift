//
//  LSWeiboFrame.swift
//  Weibo_swift
//
//  Created by 李明禄 on 16/9/11.
//  Copyright © 2016年 SocererGroup. All rights reserved.
//

import UIKit

class LSWeiboFrame: NSObject {
    
    
    var iconFrame: CGRect!
    
    var nameFrame: CGRect!
    
    var vipFrame: CGRect!
    
//    let textFrame: CGRect! = nil
    
//    let picFrame: CGRect!
//    
    var cellHeight: CGFloat!
    
    var _weibo: Weibo!
    
    var weibo: Weibo {
        
        set(newValue) {
        
//            _weibo = newValue
            let margin: CGFloat = 10
             //头像
            let iconX = margin
            let iconY = iconX
            
            let iconWidth: CGFloat = 30
            let iconHeight = iconWidth
            
            self.iconFrame = CGRectMake(iconX, iconY, iconWidth, iconHeight)
            
            //昵称
            
            let nameSize = sizeWithText(weibo.name, font: UIFont.systemFontOfSize(13), maxSize: CGSizeMake(CGFloat(MAXFLOAT), CGFloat(MAXFLOAT)))
            let nameW = nameSize.width
            let nameH = nameSize.height
            let nameX = CGRectGetMaxX(self.iconFrame) + margin
            let nameY = margin + (iconHeight - nameH) * 0.5
            self.nameFrame = CGRectMake(nameX, nameY, nameW, nameH)
            
            //vip
            let vipW: CGFloat = 15
            let vipH: CGFloat = 15
            let vipX = CGRectGetMaxX(self.nameFrame) + margin
            let vipY = margin + (iconHeight - vipH) * 0.5
            self.vipFrame = CGRectMake(vipX, vipY, vipW, vipH)
            
            //正文
            
            self.cellHeight = CGRectGetMaxY(self.vipFrame)
        
        }
        get{
            return self.weibo
        }
    }
    
     override init() {
        super.init()
        _weibo = weibo
    }
//
    
    
    func sizeWithText(text: NSString, font: UIFont, maxSize: CGSize)->CGSize {
    
        //设置一个给定的字体
       
        let attrs: NSDictionary = [font: NSFontAttributeName]
        let size = text.boundingRectWithSize(maxSize, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: attrs as? [String : AnyObject], context: nil).size
        
        return size
        
    }
    
    

}
