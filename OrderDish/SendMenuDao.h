//
//  SendMenuDao.h
//  OrderDish
//
//  Created by lunarboat on 15/8/26.
//  Copyright (c) 2015年 lunarboat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DatebaseUtil.h"
#import "OrderMenu.h"

@interface SendMenuDao : NSObject

+(BOOL)insertData:(OrderMenu*)myMenu;
+(int)quaryMaxGroupId;
@end
