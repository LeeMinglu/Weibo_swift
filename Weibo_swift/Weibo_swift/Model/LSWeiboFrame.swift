//
//  LSWeiboFrame.swift
//  Weibo_swift
//
//  Created by 李明禄 on 16/9/11.
//  Copyright © 2016年 SocererGroup. All rights reserved.
//

import UIKit

class LSWeiboFrame: NSObject {
    
    
    var iconFrame: CGRect! = nil
    
    var nameFrame: CGRect!
    
    var vipFrame: CGRect!
    
    let screenSize = UIScreen.mainScreen().bounds.size
    
    let fontLbName = UIFont.systemFontOfSize(13)
    let fontLbText = UIFont.systemFontOfSize(15)
    
    var textFrame: CGRect!
    
    var picFrame: CGRect?
//
    var cellHeight: CGFloat!
    
//    var _weibo: Weibo!
    
    var weibo: Weibo! {
        
        didSet {
            let margin: CGFloat = 10
             //头像
            let iconX = margin
            let iconY = iconX
            
            let iconWidth: CGFloat = 30
            let iconHeight = iconWidth
            
            self.iconFrame = CGRectMake(iconX, iconY, iconWidth, iconHeight)
            
            //昵称
            
            let nameSize = sizeWithText(weibo.name, font: fontLbName, maxSize: CGSizeMake(screenSize.width, CGFloat(MAXFLOAT)))
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
           
            let contentX = iconX
            let contentY = CGRectGetMaxY(self.iconFrame) + margin
            let maxW = screenSize.width - 2 * margin
            
            let contentSize = sizeWithText(weibo.text, font: fontLbText, maxSize: CGSizeMake(maxW, CGFloat(MAXFLOAT)))
            let contentW = contentSize.width
            let contentH = contentSize.height
            
            self.textFrame = CGRectMake(contentX, contentY, contentW, contentH)
            
            print("\(weibo.name)" + "textFrame是" + "\(textFrame)")
            
           
            
            let picX = margin
            let picW:CGFloat = 100
            let picH:CGFloat = 100
            let picY = CGRectGetMaxY(textFrame!)
            self.picFrame = CGRectMake(picX, picY, picW, picH)
             print("\(weibo.name)" + "picFrame是" + "\(picFrame)")
            
            if self.weibo.picture.characters.count == 0 {
                self.cellHeight = CGRectGetMaxY(self.textFrame!)
            } else {
                
                self.cellHeight = CGRectGetMaxY(self.picFrame!)

            }
      }
       
    }
    
     override init() {

    }
    
    
    func sizeWithText(text: NSString, font: UIFont, maxSize: CGSize)->CGSize {
    
        //设置一个给定的字体
       
        let attrs: NSDictionary = [font: NSFontAttributeName]
        
        let size = text.boundingRectWithSize(maxSize, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: attrs as? [String : AnyObject], context: nil).size

        return size
        
    }
    
    

}
