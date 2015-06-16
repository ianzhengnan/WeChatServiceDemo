//
//  ServiceMessageBaseCell.h
//  WeChatServiceDemo
//
//  Created by zhengna on 15/6/14.
//  Copyright (c) 2015年 zhengna. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServiceMessage.h"
#import "ServiceMessageFrameInfo.h"
#import "ServiceMessageListImageItem.h"

@interface ServiceMessageBaseCell : UITableViewCell
@property (nonatomic, strong) ServiceMessage *message;
@property (nonatomic, strong) ServiceMessageFrameInfo *frameInfo;
+ (id) loadFromXib;
- (void) setMessage:(ServiceMessage *)message frameInfo:(ServiceMessageFrameInfo *)info;
- (void) setMessageItem:(ServiceMessageListImageItem *)message;
@end
