//
//  MyMenuViewController.h
//  OrderDish
//
//  Created by lunarboat on 15/8/25.
//  Copyright (c) 2015年 lunarboat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyMenuViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,retain) NSMutableArray *myMenuArr;

@end
