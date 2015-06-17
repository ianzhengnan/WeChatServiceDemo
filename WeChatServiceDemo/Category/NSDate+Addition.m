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

- (BOOL)isEqualToDateIgnoreTime:(NSDate *)date{
    
    NSDateComponents *component1 = [self componentsOfDay];
    NSDateComponents *component2 = [date componentsOfDay];
    
    return (component1.year == component2.year && component1.month == component2.month
            && component1.day == component2.day);
    
}

- (BOOL)isToday{
    NSDate *date = [NSDate date];
    return [self isEqualToDateIgnoreTime:date];
}

- (BOOL)isYesterday{
    NSTimeInterval time = [[NSDate date] timeIntervalSince1970] - 24*60*60;
    NSDate *yesterdayDate = [NSDate dateWithTimeIntervalSince1970:time];
    return [self isEqualToDateIgnoreTime:yesterdayDate];
}

+ (NSString *)stringWithTimeInterval:(NSTimeInterval)time{
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    NSTimeInterval nowTime = [[NSDate date] timeIntervalSince1970];
    NSInteger hour = [date componentsOfDay].hour;
    NSInteger minute = [date componentsOfDay].minute;
    
    if(nowTime-time >= 7*24*60*60){
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy年MM月DD日 HH:mm"];
        return [formatter stringFromDate:date];
        
    }else{
        if ([date isToday]) {
            return [NSString stringWithFormat:@"今天 %ld:%ld", hour, minute];
        }else if([date isYesterday]){
            return [NSString stringWithFormat:@"昨天 %ld:%ld", hour, minute];
        }else{
            NSArray *weekInfo = @[@"星期日",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六"];
            NSInteger weekDay = [date componentsOfDay].weekday;
            NSString *weekString = weekInfo[weekDay - 1];
            return [NSString stringWithFormat:@"%@ %ld:%ld", weekString, hour, minute];
        }
    }
}

@end
