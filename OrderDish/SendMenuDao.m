//
//  SendMenuDao.m
//  OrderDish
//
//  Created by lunarboat on 15/8/26.
//  Copyright (c) 2015年 lunarboat. All rights reserved.
//

#import "SendMenuDao.h"

@implementation SendMenuDao

+(BOOL)insertData:(OrderMenu *)myMenu{
    FMDatabase *db = [DatebaseUtil sharedDatebase];
    if (![db open]) {
        [db close];
        return NO;
    }
    [db setShouldCacheStatements:YES];
    BOOL result = [db executeUpdate:@"INSERT INTO orderTable(picName,menuName,Price,kind,menuNum,remark,groupId) VALUES (?,?,?,?,?,?,?)",myMenu.orderPicName,myMenu.orderMenuName,@(myMenu.orderPice),myMenu.orderKind,@(myMenu.orderMenuNum),myMenu.orderRemark,@(myMenu.orderGroupId)];
    [db close];
    return result;
    
}
+(int)quaryMaxGroupId{
    int i = 1;
    FMDatabase *db = [DatebaseUtil sharedDatebase];
    if (![db open]) {
        [db close];
        return -1;
    }
    [db setShouldCacheStatements:YES];
    FMResultSet * rs = [db executeQuery:@"SELECT MAX(groupId) FROM orderTable"];
    while ([rs next]) {
        i = [rs intForColumn:@"MAX(groupId)"];
    }
    [rs close];
    [db close];
    return i;
    
}

@end
