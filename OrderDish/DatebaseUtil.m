//
//  DatebaseUtil.m
//  OrderDish
//
//  Created by lunarboat on 15/8/24.
//  Copyright (c) 2015年 lunarboat. All rights reserved.
//

#import "DatebaseUtil.h"

@implementation DatebaseUtil

+(FMDatabase*)sharedDatebase{
    static FMDatabase *db = nil;
    if (db == nil) {
        db = [[FMDatabase alloc]initWithPath:[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/database.sqlit"]];
        
    }
    return db;
}

+(void)moveDataBaseToDoucments{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"database" ofType:@"sqlite"];
    NSString *toPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/database.sqlit"];
        
    if (![[NSFileManager defaultManager] fileExistsAtPath:toPath]) {
        [[NSFileManager defaultManager] copyItemAtPath:path toPath:toPath error:nil];
    }
    
}

@end
