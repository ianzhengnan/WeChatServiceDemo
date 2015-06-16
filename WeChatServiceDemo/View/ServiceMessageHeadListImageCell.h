//
//  ServiceMessageHeadListImageCell.h
//  WeChatServiceDemo
//
//  Created by zhengna on 15/6/15.
//  Copyright (c) 2015年 zhengna. All rights reserved.
//

#import "ServiceMessageBaseCell.h"
#import "ServiceMessageListImageItem.h"

@interface ServiceMessageHeadListImageCell : ServiceMessageBaseCell
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;

@end
