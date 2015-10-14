//
//  MyMenuTableViewCell.m
//  OrderDish
//
//  Created by lunarboat on 15/8/26.
//  Copyright (c) 2015年 lunarboat. All rights reserved.
//

#import "MyMenuTableViewCell.h"

@implementation MyMenuTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)addClick:(id)sender {
    }
- (IBAction)reduceClick:(id)sender {
    int num = [self.menuNumber.text integerValue];
    num--;
    self.menuNumber.text = [NSString stringWithFormat:@"%d",num];
}

@end
