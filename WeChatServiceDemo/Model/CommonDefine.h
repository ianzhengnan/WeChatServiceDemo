//
//  CommonDefine.h
//  WeChatServiceDemo
//
//  Created by zhengna on 15/6/12.
//  Copyright (c) 2015年 zhengna. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonDefine : NSObject

typedef enum{
    
    kServiceMessageTypeText = 1, //messages
    kServiceMessageTypeSingleImage = 2, //Single image
    kServiceMessageTypeListImage = 3    //List image
    
    
}ServiceMessageType;

#define kTitleFontSize 12
#define kContentFontSize 12
#define kMessageImageContentWidth [[UIScreen mainScreen] bounds].size.width - 50

#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height
#define kSingleLineLableHeight 27
#define kMessageTextContentWidth 200
#define kHeadImageViewHeight 160
#define kMessageTextContentPadding 5

@end
