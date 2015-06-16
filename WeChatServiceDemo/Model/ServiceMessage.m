//
//  ServiceMessage.m
//  WeChatServiceDemo
//
//  Created by zhengna on 15/6/12.
//  Copyright (c) 2015年 zhengna. All rights reserved.
//

#import "ServiceMessage.h"
#import "ServiceMessageListImageItem.h"

@implementation ServiceMessage

- (id)initWithDic:(NSDictionary *)dic {
    self = [super self];
    if(self){
        self.type = [dic[@"type"] integerValue];
        self.messageTime = [dic[@"datetime"] doubleValue]/1000;
        NSArray *contents = dic[@"contents"];
        
        switch (self.type) {
            case kServiceMessageTypeText:
            {
                self.text = contents[0][@"text"];
            }
                break;
            case kServiceMessageTypeSingleImage:
            {
                NSDictionary *dicInfo = contents[0];
                self.title = dicInfo[@"title"];
                self.text = dicInfo[@"text"];
                self.imageUrl = dicInfo[@"imgPath"];
                self.webUrl = dicInfo[@"webUrl"];
                self.releaseTime = self.messageTime;
            
            }
                break;
            case kServiceMessageTypeListImage:
            {
                NSMutableArray *contentInfos = [[NSMutableArray alloc] init];
                for (NSDictionary *dicInfo in contents) {
                    ServiceMessageListImageItem *item = [[ServiceMessageListImageItem alloc] init];
                    item.title = dicInfo[@"title"];
                    item.imageUrl = dicInfo[@"imgPath"];
                    [contentInfos addObject:item];
                }
                self.contents = [[NSArray alloc] initWithArray:contentInfos];
                contentInfos = nil;
            
            }
                break;
            default:
                break;
        }
    }
    return self;
}

@end
