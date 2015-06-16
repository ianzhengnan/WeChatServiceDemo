//
//  NSDate+Addition.m
//  WeChatServiceDemo
//
//  Created by zhengna on 15/6/15.
//  Copyright (c) 2015年 zhengna. All rights reserved.
//

#import "NSDate+Addition.h"

@implementation NSDate (Addition)
//Getting current time's full datetime
-(NSDateComponents *)componentsOfDay{

    return [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond fromDate:self];
}

- (NSString *)stringWithExcludeThisYear{
    
    BOOL isThisYear = NO;
    NSDate *nowDate = [NSDate date];
    if([nowDate componentsOfDay].year != [self componentsOfDay].year){
        isThisYear = NO;
    }else{
        isThisYear = YES;
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    if(isThisYear){
        [formatter setDateFormat:@"MM月DD日"];
    }else{
        [formatter setDateFormat:@"yyyy年MM月DD日"];
    }
    
    return [formatter stringFromDate:self];
}
@end
