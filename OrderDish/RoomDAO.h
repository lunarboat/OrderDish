//
//  RoomDAO.h
//  OrderDish
//
//  Created by lunarboat on 15/8/26.
//  Copyright (c) 2015年 lunarboat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MenuAndRoom.h"
#import "DatebaseUtil.h"

@interface RoomDAO : NSObject

+(BOOL)insertData:(MenuAndRoom *)myMenu;

@end
