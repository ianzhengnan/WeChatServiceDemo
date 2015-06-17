//
//  ServiceMessageToolBar.h
//  WeChatServiceDemo
//
//  Created by zhengna on 15/6/16.
//  Copyright (c) 2015年 zhengna. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ServiceMessageToolBar : UIToolbar
- (void)initWithItem:(NSArray *)items actionBlock:(void(^)(NSInteger index))block;
- (void)buildButtons;
@end
