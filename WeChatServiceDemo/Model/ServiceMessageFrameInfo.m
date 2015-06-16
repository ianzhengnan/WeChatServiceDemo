//
//  ServiceMessageFrameInfo.m
//  WeChatServiceDemo
//
//  Created by zhengna on 15/6/12.
//  Copyright (c) 2015年 zhengna. All rights reserved.
//

#import "ServiceMessageFrameInfo.h"
#import "CommonDefine.h"
#import "UIView+Sizes.h"

@implementation ServiceMessageFrameInfo
- (id)initWithMessage: (ServiceMessage *)message{
    
    self = [super init];
    if (self) {
        if(!message){
            return self;
        }
        switch (message.type) {
            case kServiceMessageTypeText:
            {
                CGSize size = [message.text sizeWithFont:[UIFont systemFontOfSize:kTitleFontSize] constrainedToSize:CGSizeMake(kMessageTextContentWidth, NSIntegerMax) lineBreakMode:NSLineBreakByCharWrapping];
                self.frameHeight = size.height + 2 * kMessageTextContentPadding;
                
            }
                break;
            case kServiceMessageTypeSingleImage:
            {
                //calculate title height
                float originX = 25;
                float originY = 12;
                CGSize size = [message.title sizeWithFont:[UIFont systemFontOfSize:kTitleFontSize] constrainedToSize:CGSizeMake(kMessageTextContentWidth, NSIntegerMax) lineBreakMode:NSLineBreakByCharWrapping];
                self.titleLableFrame = CGRectMake(originX, originY, kMessageTextContentWidth, size.height);
                
                //calculate datetime
                self.dateTimeLableFrame = CGRectMake(originX, [self bottomForFrame:self.titleLableFrame], kMessageTextContentWidth, kSingleLineLableHeight);
                
                //calculate head height
                self.headImageViewFrame = CGRectMake(originX, [self bottomForFrame:self.dateTimeLableFrame], kMessageTextContentWidth, kHeadImageViewHeight);
                
                size = [message.text sizeWithFont:[UIFont systemFontOfSize:kContentFontSize] constrainedToSize:CGSizeMake(kMessageImageContentWidth, NSIntegerMax) lineBreakMode:NSLineBreakByCharWrapping];
                
                self.briefIntroLableFrame = CGRectMake(originX, [self bottomForFrame:self.headImageViewFrame], kMessageTextContentWidth, size.height);
                
                
                
                self.tailViewFrame = CGRectMake(0, [self bottomForFrame:self.briefIntroLableFrame], kScreenWidth, 60);
                
                self.frameHeight = [self bottomForFrame:self.tailViewFrame];
                
            }
                break;
            case kServiceMessageTypeListImage:
                //do nothing
                break;
                
            default:
                break;
        }
    }
    return self;
}

- (float)bottomForFrame:(CGRect)frame{
    return frame.origin.y + frame.size.height;
}

@end
