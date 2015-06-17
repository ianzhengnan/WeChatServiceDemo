//
//  NSDate+Addition.h
//  WeChatServiceDemo
//
//  Created by zhengna on 15/6/15.
//  Copyright (c) 2015年 zhengna. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Addition)
- (NSString *)stringWithExcludeThisYear;
//return time format according different time
+ (NSString *)stringWithTimeInterval:(NSTimeInterval)time;
@end
