//
//  OrderMenu.h
//  OrderDish
//
//  Created by lunarboat on 15/8/26.
//  Copyright (c) 2015年 lunarboat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrderMenu : NSObject

@property (nonatomic,assign)int orderID;
@property (nonatomic,retain)NSString *orderPicName;
@property (nonatomic,retain)NSString *orderMenuName;
@property (nonatomic,assign)int orderPice;
@property (nonatomic,retain)NSString *orderKind;
@property (nonatomic,assign)int orderMenuNum;
@property (nonatomic,retain)NSString *orderRemark;
@property (nonatomic,assign)int orderGroupId;

@end
