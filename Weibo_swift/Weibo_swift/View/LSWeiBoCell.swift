//
//  LSWeiboCell.swift
//  Weibo_swift
//
//  Created by 李明禄 on 16/11/8.
//  Copyright © 2016年 SocererGroup. All rights reserved.
//

import UIKit

class LSWeiboCell: UITableViewCell {
    
    // MARK: cell 子控件
    var imageViewIcon: UIImageView!
    var lbName: UILabel!
    var lbText: UILabel!
    var vipImageView: UIImageView!
    var picImageView: UIImageView?
    // MARK:  /*设置字体大小*/
    let fontLbName = UIFont.systemFontOfSize(13)
    let fontLbText = UIFont.systemFontOfSize(15)
    
    var weiboFrame: LSWeiboFrame!  {
        
        didSet {
            let weibo = self.weiboFrame.weibo


            self.imageViewIcon.frame = weiboFrame.iconFrame
            self.lbName.frame = weiboFrame.nameFrame
            self.vipImageView.frame = weiboFrame.vipFrame
            self.lbText.frame = weiboFrame.textFrame
            self.picImageView!.frame = weiboFrame.picFrame!
            
            self.imageViewIcon.image = UIImage.init(named: weibo.icon);
            self.lbName.text = weibo.name
            self.lbText.text = weibo.text
            if weibo.vip {
                self.lbName.textColor = UIColor.redColor()
                self.vipImageView.hidden = false
            }else {
                self.lbName.textColor = UIColor.blackColor()
                self.vipImageView.hidden = true
            }
            
            if weibo.picture.isEmpty {
                self.picImageView!.hidden = true
            }else {
                self.picImageView!.image = UIImage.init(named: weibo.picture)
                self.picImageView!.hidden = false
            }

        }
    }
    
    func sizeWithText(text: NSString, font: UIFont, maxSize: CGSize)->CGSize {
        
        //设置一个给定的字体
        
        let attrs: NSDictionary = [font: NSFontAttributeName]
        let size = text.boundingRectWithSize(maxSize, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: attrs as? [String : AnyObject], context: nil).size
        
        return size
        
    }
 
   // MARK: weiboFrame的setter方法

  // MARK:  ************ 重写initWithStyle方法 *******
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: reuseIdentifier)
       if !self.isEqual(nil) {
        //动态创建子控件
        let iconImageView = UIImageView.init()
        iconImageView.frame = CGRectMake(10, 10, 30,30)
        self.contentView.addSubview(iconImageView)
        self.imageViewIcon = iconImageView
        
        let nameLabel = UILabel.init()
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.backgroundColor = UIColor.grayColor()
        nameLabel.font = fontLbName
        self.contentView.addSubview(nameLabel)
        self.lbName = nameLabel

        let vipView = UIImageView.init()
        self.contentView.addSubview(vipView)
        vipView.image = UIImage.init(named: "vip")
        self.vipImageView = vipView
//        
        let textView = UILabel.init()
        self.contentView.addSubview(textView)
        //自动换行
        textView.font = fontLbText
        textView.adjustsFontSizeToFitWidth = true
        textView.sizeToFit()
        textView.numberOfLines = 0
        
        self.lbText = textView
        let picView = UIImageView.init()
        self.contentView.addSubview(picView)
        self.picImageView = picView
    
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
