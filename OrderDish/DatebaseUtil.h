//
//  DatebaseUtil.h
//  OrderDish
//
//  Created by lunarboat on 15/8/24.
//  Copyright (c) 2015年 lunarboat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FMDB/FMDB.h>

@interface DatebaseUtil : NSObject

+(FMDatabase*)sharedDatebase;
+(void)moveDataBaseToDoucments;
@end
