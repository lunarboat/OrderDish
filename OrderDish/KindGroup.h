//
//  KindGroup.h
//  OrderDish
//
//  Created by lunarboat on 15/8/24.
//  Copyright (c) 2015年 lunarboat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KindGroup : NSObject

@property (nonatomic,assign) int groupId;
@property (nonatomic,retain) NSString *groupKind;
@property (nonatomic,retain) NSString *groupName;
@property (nonatomic,retain) NSString *groupImageName;
@property (nonatomic,retain) NSString *groupHighlightImageName;

@end
