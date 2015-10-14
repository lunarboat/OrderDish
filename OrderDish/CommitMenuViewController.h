//
//  CommitMenuViewController.h
//  OrderDish
//
//  Created by lunarboat on 15/8/26.
//  Copyright (c) 2015年 lunarboat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuAndRoom.h"
#import "RoomDAO.h"

@interface CommitMenuViewController : UIViewController<UIAlertViewDelegate>

@property (nonatomic,retain) NSNumber *groupId;
@property (weak, nonatomic) IBOutlet UIButton *selectedRoom;

@end
