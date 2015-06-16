//
//  ServiceMessageTextCell.m
//  WeChatServiceDemo
//
//  Created by zhengna on 15/6/12.
//  Copyright (c) 2015年 zhengna. All rights reserved.
//

#import "ServiceMessageTextCell.h"
#import "CommonDefine.h"
#import "UIView+Sizes.h"

@implementation ServiceMessageTextCell

- (void)awakeFromNib {
    // Initialization code
    UIImage *image = [[UIImage imageNamed:@"cell_bg_text"] resizableImageWithCapInsets:UIEdgeInsetsMake(20, 20, 20, 20)];
    self.backgroudImageView.image = image;
    
    //RTLable
    _rtLable = [[RTLabel alloc] initWithFrame:CGRectZero];
    _rtLable.font = [UIFont systemFontOfSize:kTitleFontSize];
    _rtLable.linkAttributes = @{@"color":@"#11118F"};
    [self.contentView addSubview:_rtLable];
    
}

- (void) layoutSubviews{
    [super layoutSubviews];
    
    self.rtLable.frame = CGRectMake(90, kMessageTextContentPadding, kMessageTextContentWidth, self.frameInfo.frameHeight - kMessageTextContentPadding*5);
    
    [self.rtLable sizeToFit];
    
    self.backgroudImageView.height = self.frameInfo.frameHeight;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setMessage:(ServiceMessage *)message frameInfo:(ServiceMessageFrameInfo *)info{
    
    self.message = message;
    self.frameInfo = info;
    _rtLable.text = message.text;
    [self setNeedsLayout];
}

@end
