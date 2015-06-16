//
//  ServiceMessageText.h
//  WeChatServiceDemo
//
//  Created by zhengna on 15/6/12.
//  Copyright (c) 2015年 zhengna. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServiceMessageText : NSObject
@property(nonatomic, strong) NSString *userId;   //user id
@property(nonatomic, strong) NSString *serviceId; //service number id
@property(nonatomic, assign) double messageTime; //message time
@property(nonatomic, strong) NSString *text;// text content
@end
		