//
//  SeparateImage.m
//  OrderDish
//
//  Created by lunarboat on 15/8/24.
//  Copyright (c) 2015年 lunarboat. All rights reserved.
//

#import "SeparateImage.h"

@implementation SeparateImage

+(UIImage *)getImageWithName:(NSString*)name{
    UIImage *image = [UIImage imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:80 topCapHeight:1];
}

@end
