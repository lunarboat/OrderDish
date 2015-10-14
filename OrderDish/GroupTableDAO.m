//
//  GroupTableDAO.m
//  OrderDish
//
//  Created by lunarboat on 15/8/24.
//  Copyright (c) 2015年 lunarboat. All rights reserved.
//

#import "GroupTableDAO.h"

@implementation GroupTableDAO

+(BOOL)insertData:(NSString *)kind name:(NSString*)name image:(NSString*)image highlight:(NSString*)highlight{
    FMDatabase *db = [DatebaseUtil sharedDatebase];
    if (![db open]) {
        [db close];
        return NO;
    }
    [db setShouldCacheStatements:YES];
    BOOL result = [db executeUpdate:@"INSERT INTO groupTable(kind,name,image,highlighted_image) VALUES (?,?,?,?)",kind,name,image,highlight];
    [db close];
    return result;
}

+(NSMutableArray*)quaryData{
    FMDatabase *db = [DatebaseUtil sharedDatebase];
    if (![db open]) {
        [db close];
        return nil;
    }
    [db setShouldCacheStatements:YES];
    FMResultSet *rs = [db executeQuery:@"SELECT * FROM groupTable"];
    NSMutableArray *array = [[NSMutableArray alloc]init];
    while ([rs next]) {
        KindGroup *group = [[KindGroup alloc]init];
        group.groupId = [rs intForColumn:@"id"];
        group.groupName = [rs stringForColumn:@"name"];
        group.groupKind = [rs stringForColumn:@"kind"];
        group.groupImageName = [rs stringForColumn:@"image"];
        group.groupHighlightImageName = [rs stringForColumn:@"highlighted_image"];
        [array addObject:group];
    }
    [rs close];
    [db close];
    return array;
}


@end
