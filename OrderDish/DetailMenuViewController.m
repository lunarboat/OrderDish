//
//  DetailMenuViewController.m
//  OrderDish
//
//  Created by lunarboat on 15/8/25.
//  Copyright (c) 2015年 lunarboat. All rights reserved.
//

#import "DetailMenuViewController.h"

@interface DetailMenuViewController ()

@end

@implementation DetailMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *backgroundImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bgp5.png"]];
    backgroundImage.frame = CGRectMake(0, 0, 700, 525);
    [self.view addSubview:backgroundImage];
    
    NSRange endIndex = [self.menu.menuPicName rangeOfString:@"."];
    NSString *detailImageName = [[self.menu.menuPicName substringToIndex:endIndex.location] stringByAppendingPathExtension:@"jpg"];
    
    UIImageView *detailImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:detailImageName]];
    detailImageView.frame = CGRectMake(26, 13, 412, 498);
    detailImageView.layer.cornerRadius = 10;
    detailImageView.clipsToBounds = YES;
    [self.view addSubview:detailImageView];

    NSString *name = self.menu.menuName;
    CGSize size = [name sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:22]}];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(616-size.width, 45, size.width, size.height)];
    label.text = name;
    label.font = [UIFont systemFontOfSize:22];
    label.textColor = [UIColor colorWithRed:182.0/255 green:160.0/255 blue:116.0/255 alpha:1];
    [self.view addSubview:label];
    
    UILabel *detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(512, 222, 180, 218)];
    detailLabel.numberOfLines = 0;
    detailLabel.textAlignment = NSTextAlignmentCenter;
    detailLabel.font = [UIFont systemFontOfSize:20];
    detailLabel.textColor = [UIColor colorWithRed:182.0/255 green:160.0/255 blue:116.0/255 alpha:1];
    detailLabel.text = [NSString stringWithFormat:@"%@\n%d/%@\n%@",self.menu.menuKind,self.menu.menuPrice,self.menu.menuUnit,self.menu.menuDetail];
    [self.view addSubview:detailLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
