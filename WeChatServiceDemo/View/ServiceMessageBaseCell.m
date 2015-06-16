//
//  ServiceMessageBaseCell.m
//  WeChatServiceDemo
//
//  Created by zhengna on 15/6/14.
//  Copyright (c) 2015年 zhengna. All rights reserved.
//

#import "ServiceMessageBaseCell.h"

@implementation ServiceMessageBaseCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (id)loadFromXib{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] objectAtIndex:0];
}

- (void) setMessage:(ServiceMessage *)message frameInfo:(ServiceMessageFrameInfo *)info{

}

@end
