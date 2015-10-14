//
//  CommitMenuViewController.m
//  OrderDish
//
//  Created by lunarboat on 15/8/26.
//  Copyright (c) 2015年 lunarboat. All rights reserved.
//

#import "CommitMenuViewController.h"
#import "SelectRoomViewController.h"

@interface CommitMenuViewController ()

@end

@implementation CommitMenuViewController{
    MenuAndRoom *room;
    BOOL isfinished;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)exitVc:(id)sender {
    if (isfinished) {
//        [self.presentingViewController.presentingViewController.navigationController popToRootViewControllerAnimated:YES];
        [self performSegueWithIdentifier:@"finishedToEnter" sender:self];
        
    }
    else{
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
}
- (IBAction)sendRoomInfoClick:(id)sender {
    if (room == nil) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请选择座位" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }else{
        if ([RoomDAO insertData:room]) {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"订餐成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
        }
        
    }
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    isfinished = YES;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString: @"toSelectRoom"]) {
        id commitVc = segue.destinationViewController;
        [commitVc setValue:self.groupId forKey:@"groupId"];
    }
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    
    room = ((SelectRoomViewController*)self.presentedViewController).showRoom;
    if (room!=nil) {
        [self.selectedRoom setTitle:room.room forState:UIControlStateNormal];
    }
}


@end
