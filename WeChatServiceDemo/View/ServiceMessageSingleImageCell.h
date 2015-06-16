//
//  ServiceMessageSingleImageCell.h
//  WeChatServiceDemo
//
//  Created by zhengna on 15/6/15.
//  Copyright (c) 2015年 zhengna. All rights reserved.
//

#import "ServiceMessageBaseCell.h"
#import "RTLabel.h"

@interface ServiceMessageSingleImageCell : ServiceMessageBaseCell

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *dataTimeLable;
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *briefIntroLable;
@property (weak, nonatomic) IBOutlet UIView *tailView;

@end
