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
    let imageViewIcon: UIImageView!
    let lbName: UILabel!
    let lbText: UILabel!
    let vipImageView: UIImageView!
    let picImageView: UIImageView!
    
  // MARK:  /*设置字体大小*/
    let fontLbName = UIFont.systemFontOfSize(13)
    let fontLbText = UIFont.systemFontOfSize(15)
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: reuseIdentifier)
       if !self.isEqual(nil) {
        //动态创建子控件
        let iconImageView = UIImageView.init()
        self.contentView.addSubview(iconImageView)
        self.imageViewIcon = iconImageView
        
        let nameLabel = UILabel.init()
        self.contentView.addSubview(nameLabel)
        self.lbName = nameLabel
        
        let vipView = UIImageView.init()
        self.contentView.addSubview(vipView)
        vipView.image = UIImage.init(named: "vip")
        self.vipImageView = vipView
        
        let textView = UILabel.init()
        self.contentView.addSubview(textView)
        //自动换行
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
