//
//  MenuAndRoom.h
//  OrderDish
//
//  Created by lunarboat on 15/8/26.
//  Copyright (c) 2015年 lunarboat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuAndRoom : NSObject

@property (nonatomic,assign) int groupId;
@property (nonatomic,retain) NSString *date;
@property (nonatomic,retain) NSString *time;
@property (nonatomic,retain) NSString *room;

@end
