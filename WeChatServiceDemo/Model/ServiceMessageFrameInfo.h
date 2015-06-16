//
//  ServiceMessageFrameInfo.h
//  WeChatServiceDemo
//
//  Created by zhengna on 15/6/12.
//  Copyright (c) 2015年 zhengna. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ServiceMessage.h"

@interface ServiceMessageFrameInfo : NSObject

@property (nonatomic, assign) float frameHeight; //cell height

@property (nonatomic, assign)CGRect titleLableFrame;
@property (nonatomic, assign)CGRect dateTimeLableFrame;
@property (nonatomic, assign)CGRect headImageViewFrame;
@property (nonatomic, assign)CGRect briefIntroLableFrame;
@property (nonatomic, assign)CGRect tailViewFrame;

//initial the frame information of related messages
- (id)initWithMessage: (ServiceMessage *)message;
@end
