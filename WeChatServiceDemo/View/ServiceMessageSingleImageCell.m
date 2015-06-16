//
//  ServiceMessageSingleImageCell.m
//  WeChatServiceDemo
//
//  Created by zhengna on 15/6/15.
//  Copyright (c) 2015年 zhengna. All rights reserved.
//

#import "ServiceMessageSingleImageCell.h"
#import "CommonDefine.h"
#import "UIImageView+WebCache.h"
#import "UIView+Sizes.h"
#import "NSDate+Addition.h"

@implementation ServiceMessageSingleImageCell

- (void)awakeFromNib {
    // Initialization code
    UIImage *image = [[UIImage imageNamed:@"cell_bg_rectangle"] resizableImageWithCapInsets:UIEdgeInsetsMake(20, 20, 20, 20)];
    self.backgroundImageView.image = image;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) layoutSubviews{
    
    [super layoutSubviews];
    
    self.backgroundImageView.height = self.frameInfo.frameHeight;
    self.titleLable.frame = self.frameInfo.titleLableFrame;
    self.dataTimeLable.frame = self.frameInfo.dateTimeLableFrame;
    self.headImageView.frame = self.frameInfo.headImageViewFrame;
    self.briefIntroLable.frame = self.frameInfo.briefIntroLableFrame;
    self.tailView.frame = self.frameInfo.tailViewFrame;
}

- (void) setMessage:(ServiceMessage *)message frameInfo:(ServiceMessageFrameInfo *)info{
    
    self.message = message;
    self.frameInfo = info;
    self.titleLable.text = message.title;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:message.releaseTime];
    self.dataTimeLable.text = [date stringWithExcludeThisYear];
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:message.imageUrl] placeholderImage:nil];
    self.briefIntroLable.text = message.text;
    [self setNeedsDisplay];
}

@end
