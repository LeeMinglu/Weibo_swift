//
//  LSWeiBoCell.swift
//  Weibo_swift
//
//  Created by 李明禄 on 16/9/17.
//  Copyright © 2016年 SocererGroup. All rights reserved.
//

import UIKit

class LSWeiBoCell: UITableViewCell {
    
    let icon: UIImage
    let name: UILabel
    let vip: UIImage
    let weibo: Weibo
  //  var _weiboFrame: LSWeiboFrame
 /*   var weiboFrame: LSWeiboFrame {
        set(newValue){
            self._weiboFrame = newValue
            
        }
        
        get {
        
            return self._weiboFrame
        }
    
    }
*/
    override func awakeFromNib()
    {
        super.awakeFromNib()
        self.backgroundColor = UIColor.redColor()
    }
    // Class 初始化
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.blueColor()
    }
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)!
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
