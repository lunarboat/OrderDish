//
//  EnterViewController.m
//  OrderDish
//
//  Created by lunarboat on 15/8/24.
//  Copyright (c) 2015年 lunarboat. All rights reserved.
//

#import "EnterViewController.h"

@interface EnterViewController ()

@end

@implementation EnterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"%d",self.navigationController.viewControllers.count);
}

-(IBAction)unwindSegue:(UIStoryboardSegue*)sender{
    //NSLog(@"%d",self.navigationController.viewControllers.count);
}

@end
