//
//  SelectRoomViewController.h
//  OrderDish
//
//  Created by lunarboat on 15/8/26.
//  Copyright (c) 2015年 lunarboat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuAndRoom.h"

@interface SelectRoomViewController : UIViewController

@property (nonatomic,retain) NSNumber *groupId;
@property (nonatomic,retain) MenuAndRoom *showRoom;

@end
