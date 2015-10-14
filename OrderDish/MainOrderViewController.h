//
//  MainOrderViewController.h
//  OrderDish
//
//  Created by lunarboat on 15/8/24.
//  Copyright (c) 2015年 lunarboat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GroupTableDAO.h"
#import "MenuTableDAO.h"

@interface MainOrderViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray *_groupArray;
    NSMutableArray *_menuArray;
}
@property (nonatomic,strong) UIPopoverController *popover;

@end
