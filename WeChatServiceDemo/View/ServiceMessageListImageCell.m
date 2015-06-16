//
//  ServiceMessageListImageCell.m
//  WeChatServiceDemo
//
//  Created by zhengna on 15/6/15.
//  Copyright (c) 2015年 zhengna. All rights reserved.
//

#import "ServiceMessageListImageCell.h"
#import "UIImageView+WebCache.h"
#import "UIView+Sizes.h"


@implementation ServiceMessageListImageCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setMessageItem:(ServiceMessageListImageItem *)message{
    
    self.headLable.text = message.title;
    [self.titleImageView sd_setImageWithURL:[NSURL URLWithString:message.imageUrl] placeholderImage:nil];
    
}

@end
