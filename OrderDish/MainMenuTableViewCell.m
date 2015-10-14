//
//  MainMenuTableViewCell.m
//  OrderDish
//
//  Created by lunarboat on 15/8/24.
//  Copyright (c) 2015年 lunarboat. All rights reserved.
//

#import "MainMenuTableViewCell.h"
#import "SeparateImage.h"

@implementation MainMenuTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.backgroundColor = [UIColor clearColor];
    UIImage *image = [SeparateImage getImageWithName:@"line32.png"];
    self.backgroundImageView.image = image;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
