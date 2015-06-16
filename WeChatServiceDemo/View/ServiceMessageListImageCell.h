//
//  ServiceMessageListImageCell.h
//  WeChatServiceDemo
//
//  Created by zhengna on 15/6/15.
//  Copyright (c) 2015年 zhengna. All rights reserved.
//

#import "ServiceMessageBaseCell.h"
#import "ServiceMessageListImageItem.h"

@interface ServiceMessageListImageCell : ServiceMessageBaseCell
@property (weak, nonatomic) IBOutlet UILabel *headLable;
@property (weak, nonatomic) IBOutlet UIImageView *titleImageView;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;

@end
