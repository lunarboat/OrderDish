//
//  SelectRoomViewController.m
//  OrderDish
//
//  Created by lunarboat on 15/8/26.
//  Copyright (c) 2015年 lunarboat. All rights reserved.
//

#import "SelectRoomViewController.h"


@interface SelectRoomViewController ()

@end

@implementation SelectRoomViewController{
    NSMutableArray *_peopleWithRoom;
    MenuAndRoom *mar;
    UIButton *_selectedBtn;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _peopleWithRoom = [[NSMutableArray alloc]init];
    mar = [[MenuAndRoom alloc]init];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)selectRoomClick:(UIButton *)sender {
    
    if (_selectedBtn != sender) {
        sender.selected = YES;
        _selectedBtn.selected = NO;
        
        mar.groupId = [self.groupId intValue];
        NSDate *date = [NSDate date];
        mar.date = [date description];
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"HH:mm"];
        mar.time = [formatter stringFromDate:date];
        switch (sender.tag) {
            case 1:
                mar.room = @"文华轩";
                break;
            case 2:
                mar.room = @"万丽";
                break;
            case 3:
                mar.room = @"希尔顿";
                break;
            case 4:
                mar.room = @"威斯汀";
                break;
            case 5:
                mar.room = @"柏悦庄";
                break;
            default:
                break;
        }

        _selectedBtn = sender;
    }
    
    
    
    
}
- (IBAction)selectedRoom:(UIButton *)sender {
    self.showRoom = mar;
//    [_peopleWithRoom addObject:mar];
    [self dismissViewControllerAnimated:YES  completion:nil];
}

- (IBAction)exitVc:(id)sender {
    [self dismissViewControllerAnimated:YES  completion:nil];
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
