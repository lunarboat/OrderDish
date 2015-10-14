//
//  MyMenuViewController.m
//  OrderDish
//
//  Created by lunarboat on 15/8/25.
//  Copyright (c) 2015年 lunarboat. All rights reserved.
//

#import "MyMenuViewController.h"
#import "MyMenuTableViewCell.h"
#import "KindMenu.h"
#import "SendMenuDao.h"
#import "OrderMenu.h"

@interface MyMenuViewController ()

@end


@implementation MyMenuViewController{
    
    __weak IBOutlet UITableView *_myMenuTableView;

    __weak IBOutlet UILabel *totalMoneyLab;
    
    int groupId;
}

- (void)viewDidLoad {
    [super viewDidLoad];
     groupId = [SendMenuDao quaryMaxGroupId] + 1;
    // Do any additional setup after loading the view.
    //NSLog(@"%d",self.orderedMenuArr.count);
    for (OrderMenu *myMenu in self.myMenuArr) {
        
        myMenu.orderGroupId = groupId;
    }
    
    
}
- (IBAction)exitClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)gatherBtnClick:(UIButton *)sender {
    
    int totalMoney = 0;
    for (OrderMenu *myMenu in _myMenuArr) {
        totalMoney = totalMoney + myMenu.orderPice * myMenu.orderMenuNum;
    }
    totalMoneyLab.text = [NSString stringWithFormat:@"%d",totalMoney];
    
}
- (IBAction)sendMenuClick:(UIButton *)sender {
    
    

    BOOL sendStatus = YES;
    for (OrderMenu *myMenu in _myMenuArr) {
        myMenu.orderGroupId = groupId;
        if (![SendMenuDao insertData:myMenu]) {
            sendStatus = NO;
        }
    }
    if (sendStatus) {
        [self performSegueWithIdentifier:@"myMenu2Commit" sender:self];
        //groupId++;
    
    }else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"选菜失败" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
        return;
        
    }
    
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _myMenuArr.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"itemCell";
    OrderMenu *myMenu = [_myMenuArr objectAtIndex:indexPath.row];
    MyMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.menuID.text = [NSString stringWithFormat:@"%d",myMenu.orderID];
    cell.menuPicture.image = [UIImage imageNamed:myMenu.orderPicName];
    cell.menuName.text = myMenu.orderMenuName;
    cell.menuKind.text = myMenu.orderKind;
    cell.menuNumber.text = [NSString stringWithFormat:@"%d",myMenu.orderMenuNum];
    cell.menuPrice.text = [NSString stringWithFormat:@"%d",myMenu.orderPice];
    cell.menuRemark.text = myMenu.orderRemark;
    cell.deleteMenuBtn.tag = indexPath.row + 100;
    [cell.deleteMenuBtn addTarget:self action:@selector(deleteMenuClick:) forControlEvents:UIControlEventTouchUpInside];
    cell.addBtn.tag = indexPath.row + 10;
    [cell.addBtn addTarget:self action:@selector(addMenuNumber:) forControlEvents:UIControlEventTouchUpInside];
    cell.reduceBtn.tag = indexPath.row + 20;
    [cell.reduceBtn addTarget:self action:@selector(reduceMenuNumber:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

-(void)addMenuNumber:(UIButton*)sender{
    int index = sender.tag - 10;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    MyMenuTableViewCell *cell = (MyMenuTableViewCell*)[_myMenuTableView cellForRowAtIndexPath:indexPath];
    int num = [cell.menuNumber.text integerValue];
    num++;
    cell.menuNumber.text = [NSString stringWithFormat:@"%d",num];
    OrderMenu *myMenu = [_myMenuArr objectAtIndex:index];
    myMenu.orderMenuNum = num;
}
-(void)reduceMenuNumber:(UIButton*)sender{
    int index = sender.tag - 20;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    MyMenuTableViewCell *cell = (MyMenuTableViewCell*)[_myMenuTableView cellForRowAtIndexPath:indexPath];
    int num = [cell.menuNumber.text integerValue];
    num--;
    num = MAX(0, num);
    cell.menuNumber.text = [NSString stringWithFormat:@"%d",num];
    OrderMenu *myMenu = [_myMenuArr objectAtIndex:index];
    myMenu.orderMenuNum = num;
}

-(void)deleteMenuClick:(UIButton*)sender{
    int index = sender.tag - 100;
    [_myMenuArr removeObjectAtIndex:index];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    [_myMenuTableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    [_myMenuTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    id commitVc = segue.destinationViewController;
    [commitVc setValue:@(groupId) forKey:@"groupId"];
}


@end
