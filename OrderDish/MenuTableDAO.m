//
//  MenuTableDAO.m
//  OrderDish
//
//  Created by lunarboat on 15/8/24.
//  Copyright (c) 2015年 lunarboat. All rights reserved.
//

#import "MenuTableDAO.h"

@implementation MenuTableDAO

+(NSMutableArray*)queryDataWithGroupID:(int)groupID{
    FMDatabase *db = [DatebaseUtil sharedDatebase];
    if (![db open]) {
        [db close];
        return nil;
    }
    [db setShouldCacheStatements:YES];
    FMResultSet *rs = [db executeQuery:@"SELECT * FROM menuTable WHERE groupID=(?)",@(groupID)];
    NSMutableArray *array = [[NSMutableArray alloc]init];
    while ([rs next]) {
        KindMenu *menu = [[KindMenu alloc]init];
        menu.menuId = [rs intForColumn:@"id"];
        menu.menuKind = [rs stringForColumn:@"iKind"];
        menu.menuName = [rs stringForColumn:@"name"];
        menu.menuPrice = [rs intForColumn:@"price"];
        menu.menuUnit = [rs stringForColumn:@"unit"];
        menu.menuDetail = [rs stringForColumn:@"detail"];
        menu.menuPicName = [rs stringForColumn:@"picName"];
        [array addObject:menu];
    }
    [rs close];
    [db close];
    return array;
}

@end
