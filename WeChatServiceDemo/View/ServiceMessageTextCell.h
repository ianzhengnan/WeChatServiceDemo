//
//  ServiceMessageTextCell.h
//  WeChatServiceDemo
//
//  Created by zhengna on 15/6/12.
//  Copyright (c) 2015年 zhengna. All rights reserved.
//

#import "ServiceMessageBaseCell.h"
#import "RTLabel.h"

@interface ServiceMessageTextCell : ServiceMessageBaseCell
@property (weak, nonatomic) IBOutlet UIImageView *backgroudImageView;
@property (strong, nonatomic) RTLabel *rtLable;

@end
