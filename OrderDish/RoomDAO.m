//
//  RoomDAO.m
//  OrderDish
//
//  Created by lunarboat on 15/8/26.
//  Copyright (c) 2015年 lunarboat. All rights reserved.
//

#import "RoomDAO.h"

@implementation RoomDAO

+(BOOL)insertData:(MenuAndRoom *)myMenu{
    FMDatabase *db = [DatebaseUtil sharedDatebase];
    if (![db open]) {
        [db close];
        return NO;
    }
    [db setShouldCacheStatements:YES];
    BOOL result = [db executeUpdate:@"INSERT INTO group_recordTable VALUES (?,?,?,?)",@(myMenu.groupId),myMenu.date,myMenu.time,myMenu.room];
    //NSLog(@"%d",result);
    [db close];
    return result;
    
}


@end
