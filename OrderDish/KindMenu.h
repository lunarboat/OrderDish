//
//  KindMenu.h
//  OrderDish
//
//  Created by lunarboat on 15/8/24.
//  Copyright (c) 2015年 lunarboat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KindMenu : NSObject

@property (nonatomic, assign) int menuId;
@property (nonatomic, retain) NSString *menuKind;
@property (nonatomic, retain) NSString *menuName;
@property (nonatomic, assign) int menuPrice;
@property (nonatomic, retain) NSString *menuUnit;
@property (nonatomic, retain) NSString *menuDetail;
@property (nonatomic, retain) NSString *menuPicName;

@end
