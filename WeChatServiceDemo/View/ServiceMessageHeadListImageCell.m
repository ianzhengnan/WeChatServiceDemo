//
//  ServiceMessageHeadListImageCell.m
//  WeChatServiceDemo
//
//  Created by zhengna on 15/6/15.
//  Copyright (c) 2015年 zhengna. All rights reserved.
//

#import "ServiceMessageHeadListImageCell.h"
#import "UIImageView+WebCache.h"
#import "UIView+Sizes.h"

@implementation ServiceMessageHeadListImageCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setMessageItem:(ServiceMessageListImageItem *)message{
    
    self.titleLable.text = message.title;
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:message.imageUrl] placeholderImage:nil];
    //max 3 lines
    float singleLineHeight = [@"LineHeight" sizeWithFont:self.titleLable.font constrainedToSize:CGSizeMake(self.titleLable.width, NSIntegerMax) lineBreakMode:NSLineBreakByCharWrapping].height;
    CGSize size = [self.titleLable.text sizeWithFont:self.titleLable.font constrainedToSize:CGSizeMake(self.titleLable.width, NSIntegerMax) lineBreakMode:NSLineBreakByCharWrapping];
    
    if(size.height > 3*singleLineHeight){
        size.height = 3*singleLineHeight;
    }
    self.titleLable.height = size.height;
    self.titleLable.bottom = self.headImageView.bottom;
}

@end
