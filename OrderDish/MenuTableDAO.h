//
//  MenuTableDAO.h
//  OrderDish
//
//  Created by lunarboat on 15/8/24.
//  Copyright (c) 2015年 lunarboat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DatebaseUtil.h"
#import "KindMenu.h"

@interface MenuTableDAO : NSObject

+(NSMutableArray*)queryDataWithGroupID:(int)groupID;

@end
