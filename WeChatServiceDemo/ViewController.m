//
//  ViewController.m
//  WeChatServiceDemo
//
//  Created by zhengna on 15/6/12.
//  Copyright (c) 2015年 zhengna. All rights reserved.
//

#import "ViewController.h"
#import "ServiceMessage.h"
#import "ServiceMessageListImageItem.h"
#import "ServiceMessageTextCell.h"
#import "ServiceMessageFrameInfo.h"
#import "ServiceMessageSingleImageCell.h"
#import "ServiceMessageListImageCell.h"
#import "ServiceMessageHeadListImageCell.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *messageDatas; //message object
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.messageDatas = [[NSMutableArray alloc] init];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"message" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSError *error = nil;
    //parse json file
    NSDictionary *messageInfo = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
     if(error){
         NSLog(@"error: %@", [error description]);
     }else{
         NSArray *messageArray = messageInfo[@"data"];
         for (NSDictionary *messageInfo in messageArray) {
             ServiceMessage *message = [[ServiceMessage alloc] initWithDic:messageInfo];
             [self.messageDatas addObject:message];
         }
     }
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return self.messageDatas.count;
}

//program mark - tableView delegate and datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    ServiceMessage *message = self.messageDatas[section];
    if(message.type == kServiceMessageTypeListImage){
        return message.contents.count;
    }else{
        return 1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ServiceMessage *message = self.messageDatas[indexPath.section];
    if(message.type != kServiceMessageTypeListImage){
        ServiceMessageFrameInfo *info = [[ServiceMessageFrameInfo alloc] initWithMessage:message];
        return info.frameHeight;
    }else{
        if(indexPath.row == 0){
            return 168;
        }else{
            return 75;
        }
    
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    NSString *cellID = @"CellID";
    NSString *textCellID = @"textCellID";
    NSString *singleImageCellID = @"singleImageCellID";
    NSString *headListImageCellID = @"headListImageCellID";
    NSString *listImageCellID = @"listImageCellID";
    ServiceMessageBaseCell *cell = nil;
    ServiceMessage *message = self.messageDatas[indexPath.section];
    
    if(message.type == kServiceMessageTypeListImage){
        ServiceMessageListImageItem *item = message.contents[indexPath.row];
        if (indexPath.row==0) {
            cell = [tableView dequeueReusableCellWithIdentifier:headListImageCellID];
            if(!cell){
                cell = [ServiceMessageHeadListImageCell loadFromXib];
            }
        }else{
            cell = [tableView dequeueReusableCellWithIdentifier:listImageCellID];
            if(!cell){
                cell = [ServiceMessageListImageCell loadFromXib];
            }
            ServiceMessageListImageCell *myCell = (ServiceMessageListImageCell *)cell;
            if (indexPath.row == message.contents.count-1) {
                [myCell.backgroundImageView setImage:[UIImage imageNamed:@"cell_bg_list_tail"]];
            }else{
                [myCell.backgroundImageView setImage:[UIImage imageNamed:@"cell_bg_list_mid"]];
            }
            
        }
        [cell setMessageItem:item];
        
    }else if(message.type == kServiceMessageTypeText){
        cell = [tableView dequeueReusableCellWithIdentifier:textCellID];
        if(!cell){
            cell = [ServiceMessageTextCell loadFromXib];
        }
        ServiceMessageFrameInfo *info = [[ServiceMessageFrameInfo alloc] initWithMessage:message];
        [cell setMessage:message frameInfo:info];
    }else{
        cell = [tableView dequeueReusableCellWithIdentifier:singleImageCellID];
        if(!cell){
            cell = [ServiceMessageSingleImageCell loadFromXib];
        }
        ServiceMessageFrameInfo *info = [[ServiceMessageFrameInfo alloc] initWithMessage:message];
        [cell setMessage:message frameInfo:info];
    }
    
    if (cell) {
        //add long-click gesture
        UILongPressGestureRecognizer *gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
        [cell addGestureRecognizer:gesture];
    }

    return cell;
}

- (BOOL)canBecomeFirstResponder{
    return YES;
}

- (void)longPress: (UILongPressGestureRecognizer *)recognizer{
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        [recognizer.view becomeFirstResponder];
        //create popup menu
        UIMenuItem *item1 = [[UIMenuItem alloc] initWithTitle:@"转发" action:@selector(forward:)];
        UIMenuItem *item2 = [[UIMenuItem alloc] initWithTitle:@"收藏" action:@selector(mark:)];
        UIMenuItem *item3 = [[UIMenuItem alloc] initWithTitle:@"更多" action:@selector(more:)];
        UIMenuController *menuController = [UIMenuController sharedMenuController];
        [menuController setMenuItems:@[item1,item2,item3]];
        [menuController setTargetRect:recognizer.view.frame inView:recognizer.view.superview];
        [menuController setMenuVisible:YES animated:YES];
    }
}

- (void)forward:(id)sender{
    NSLog(@"%s", __func__);
}

- (void)mark:(id)sender{
    NSLog(@"%s", __func__);
}

- (void)more:(id)sender{
    NSLog(@"%s", __func__);
}

@end
