//
//  GroupTableDAO.h
//  OrderDish
//
//  Created by lunarboat on 15/8/24.
//  Copyright (c) 2015年 lunarboat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DatebaseUtil.h"
#import "KindGroup.h"

@interface GroupTableDAO : NSObject

+(NSMutableArray*)quaryData;
+(BOOL)insertData:(NSString *)kind name:(NSString*)name image:(NSString*)image highlight:(NSString*)highlight;
@end
