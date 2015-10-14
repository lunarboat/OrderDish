//
//  MyMenuTableViewCell.h
//  OrderDish
//
//  Created by lunarboat on 15/8/26.
//  Copyright (c) 2015年 lunarboat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyMenuTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *menuID;
@property (weak, nonatomic) IBOutlet UIImageView *menuPicture;
@property (weak, nonatomic) IBOutlet UILabel *menuName;
@property (weak, nonatomic) IBOutlet UILabel *menuPrice;
@property (weak, nonatomic) IBOutlet UILabel *menuKind;
@property (weak, nonatomic) IBOutlet UITextField *menuNumber;
@property (weak, nonatomic) IBOutlet UILabel *menuRemark;
@property (weak, nonatomic) IBOutlet UIButton *deleteMenuBtn;
@property (weak, nonatomic) IBOutlet UIButton *reduceBtn;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@end
