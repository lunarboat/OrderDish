//
//  MainOrderViewController.m
//  OrderDish
//
//  Created by lunarboat on 15/8/24.
//  Copyright (c) 2015年 lunarboat. All rights reserved.
//

#import "MainOrderViewController.h"
#import "MainMenuTableViewCell.h"
#import "SeparateImage.h"
#import "DetailMenuViewController.h"
#import "MyMenuViewController.h"
#import "OrderMenu.h"
#define GroupBtnWidth 38
#define GroupBtnHeight 100

@interface MainOrderViewController ()

@end

@implementation MainOrderViewController{
    
    
    NSArray *_sectionTitleArray;
    UIScrollView *_groupScrollView;
    UIView *_zctjView;
    UITableView *_zctjTableView;
    KindGroup *_selectedGroup;
    
    NSMutableArray *_bigArray;
    
    //选中的菜
    //NSMutableArray *_orderedMenu;
    NSMutableArray *_myMenu;
    //设置详细的界面的值
    KindMenu *_selectedMenu;
    
    //设置要展开的组
    int showDetailSection;
    //设置选中的按钮
    UIButton *SelectedBtn;
    
    __weak IBOutlet UIImageView *zctjImageView;
    
    __weak IBOutlet UIImageView *backGround;
    __weak IBOutlet UIImageView *background2;
    __weak IBOutlet UIButton *detailBtn;
    __weak IBOutlet UIButton *orderMenuBtn;
    __weak IBOutlet UIButton *myMenuBtn;
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    _groupScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(970, 45, GroupBtnWidth, 7 * GroupBtnHeight)];
    _groupArray = [GroupTableDAO quaryData];
    //_orderedMenu = [[NSMutableArray alloc]init];
    _myMenu = [[NSMutableArray alloc]init];
    //NSLog(@"%d",_groupArray.count);
    CGSize scrollContentSize = CGSizeMake(GroupBtnWidth, _groupArray.count * GroupBtnHeight);
    _groupScrollView.contentSize =scrollContentSize;
    _groupScrollView.alwaysBounceVertical = YES;
    [self.view addSubview:_groupScrollView];
    
    _zctjView = [[UIView alloc]initWithFrame:CGRectMake(662,20,312,740)];
    [self.view addSubview:_zctjView];
    zctjImageView.layer.cornerRadius = 10;
    zctjImageView.clipsToBounds = YES;
    
    
    //加载第一组
    _selectedGroup = [_groupArray objectAtIndex:0];
    _bigArray = [[NSMutableArray alloc]init];
    _sectionTitleArray = [[NSMutableArray alloc]init];
    [self getPresentMenu];
    _selectedMenu = [[_bigArray objectAtIndex:0] objectAtIndex:0];
    
    //加载组btn
    [self loadBtn];
    //加载主厨推荐
    [self loadZctjView];
    
    
    
}

-(void)loadSecondView{
   [_zctjTableView removeFromSuperview];
//    _zctjTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, 296, 740) style:UITableViewStyleGrouped];
    _zctjView.hidden = YES;
    _zctjTableView.frame = CGRectMake(0, 20, 296, 650);
    [self.view addSubview:_zctjTableView];
    backGround.image = [UIImage imageNamed:@"bgp4"];
    background2.frame = CGRectMake(304, 30, 650, 720);
    background2.image = [UIImage imageNamed:@"bgp41.png"];
    zctjImageView.frame = CGRectMake(310, 35, 500, 710);
    detailBtn.frame = CGRectMake(851, 130, 95, 39);
    detailBtn.alpha = 0.1;
    orderMenuBtn.frame = CGRectMake(851, 91, 95, 39);
    orderMenuBtn.alpha = 0.1;
}

-(void)loadZctjView{
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bgp33.png"]];
    imageView.frame = CGRectMake(0, 0, 312, 740);
    [_zctjView addSubview:imageView];
    _zctjTableView = _zctjTableView = [[UITableView alloc]initWithFrame:CGRectMake(8, 108, 296, 624) style:UITableViewStyleGrouped];
    [_zctjView addSubview:_zctjTableView];
    _zctjTableView.dataSource = self;
    _zctjTableView.delegate = self;
    _zctjTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _zctjTableView.backgroundColor = [UIColor clearColor];
    
}

-(void)changeZctjView{
    [_zctjTableView removeFromSuperview];
    _zctjView.hidden = NO;
    _zctjTableView.frame = CGRectMake(8, 108, 296, 624);
    [_zctjView addSubview:_zctjTableView];
    backGround.image = [UIImage imageNamed:@"bgp3"];
    background2.frame = CGRectMake(0, 0, 1024, 768);
    background2.image = [UIImage imageNamed:@"bgp31.png"];
    zctjImageView.frame = CGRectMake(0, 11, 1024, 768);
    detailBtn.frame = CGRectMake(572, 716, 95, 39);
    detailBtn.alpha = 1;
    orderMenuBtn.frame = CGRectMake(16, 672, 115, 31);
    orderMenuBtn.alpha = 1;
}

-(void)loadBtn{
    for (int i=0; i<_groupArray.count; i++) {
        KindGroup *group = [_groupArray objectAtIndex:i];
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, GroupBtnHeight * i, GroupBtnWidth, GroupBtnHeight)];
        [btn setImage:[UIImage imageNamed:group.groupImageName] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:group.groupHighlightImageName] forState:UIControlStateSelected];
        btn.tag = i+100;
        [btn addTarget:self action:@selector(groupBtnClick:) forControlEvents:UIControlEventTouchUpInside];

        [_groupScrollView addSubview:btn];
        if (i==0) {
            SelectedBtn = btn;
            btn.selected = YES;
        }
    }
}

-(void)groupBtnClick:(UIButton*)sender{
    
    
    if (SelectedBtn!=sender) {
        SelectedBtn.selected = NO;
        sender.selected = YES;
        int index = sender.tag - 100;
        _selectedGroup = [_groupArray objectAtIndex:index];
        //NSLog(@"%d",_groupArray.count);
        [self getPresentMenu];
        
        [_zctjTableView reloadData];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [self tableView:_zctjTableView didSelectRowAtIndexPath:indexPath];
        
        SelectedBtn = sender;
        
    }
    if (sender.tag!=100) {
        [self loadSecondView];
    }else{
        [self changeZctjView];
    }
    
    
}

-(void)getPresentMenu{
    [_bigArray removeAllObjects];
    _menuArray = [MenuTableDAO queryDataWithGroupID:_selectedGroup.groupId];
    //NSLog(@"===%d",_menuArray.count);
    
    _sectionTitleArray = [_selectedGroup.groupName componentsSeparatedByString:@"|"];
    for (int i=0; i<_sectionTitleArray.count; i++) {
        NSMutableArray *array = [[NSMutableArray alloc]init];
        for (int j=0; j<_menuArray.count; j++) {
            NSString *sectionTitle = [_sectionTitleArray objectAtIndex:i];
            KindMenu *menu = [_menuArray objectAtIndex:j];
            NSString *menuTitle = menu.menuKind;
            if ([menuTitle isEqualToString:sectionTitle]) {
                [array addObject:menu];
            }
        }
        [_bigArray addObject:array];
    }
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == showDetailSection) {
        return [_bigArray[showDetailSection] count];
    }
    return 0;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _bigArray.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"GroupCell";
    MainMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MainMenuTableViewCell" owner:self options:nil] lastObject];
    }
    KindMenu *menu = [_bigArray[indexPath.section] objectAtIndex:indexPath.row];
    cell.foodName.text = menu.menuName;
    cell.foodPrice.text = [NSString stringWithFormat:@"%d/%@",menu.menuPrice,menu.menuUnit];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 64;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        cell.bounds = CGRectMake(0, 0, cell.bounds.size.width-40, cell.bounds.size.height);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
         cell.bounds = CGRectMake(0, 0, cell.bounds.size.width+40, cell.bounds.size.height);
        } completion:nil];
    }];
    //NSLog(@"%d",_bigArray.count);
    KindMenu *menu = [[_bigArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    NSString *imageName = menu.menuPicName;
    zctjImageView.image = [UIImage imageNamed:imageName];
    _selectedMenu = menu;
    
}
//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    return 0;
//}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, _zctjTableView.frame.size.width, 64)];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[SeparateImage getImageWithName:@"line31.png"]];
    imageView.frame = CGRectMake(0, 22, _zctjTableView.frame.size.width/2, 42);
    [view addSubview:imageView];
    
    NSString *sectionTitle = [_sectionTitleArray objectAtIndex:section];
    
    CGSize size = [sectionTitle sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:22]}];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(view.frame.size.width/2-30-size.width, 24, size.width, size.height)];
    label.text = sectionTitle;
    label.font = [UIFont systemFontOfSize:22];
    label.textColor = [UIColor colorWithRed:182.0/255 green:160.0/255 blue:116.0/255 alpha:1];
    [view addSubview:label];
    
    UIButton *button = [[UIButton alloc]initWithFrame:view.frame];
    button.backgroundColor = [UIColor clearColor];
    button.tag = section+200;
    [button addTarget:self action:@selector(showDetail:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    
    return view;
}
-(void)showDetail:(UIButton*)sender{
    //NSLog(@"%d",sender.tag);
    NSMutableIndexSet *indexSet = [NSMutableIndexSet indexSet];
    [indexSet addIndex:showDetailSection];
    [indexSet addIndex:sender.tag-200];
    
    showDetailSection = sender.tag - 200;
    [_zctjTableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated
    
}
- (IBAction)detailBtnClick:(UIButton *)sender {
    DetailMenuViewController *dmVc = [[DetailMenuViewController alloc]init];
    dmVc.menu = _selectedMenu;
    
    self.popover = [[UIPopoverController alloc]initWithContentViewController:dmVc];
    self.popover.popoverContentSize = CGSizeMake(700, 525);
    [self.popover presentPopoverFromRect:sender.bounds inView:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
    
}

- (IBAction)orderMenuClick:(UIButton *)sender {
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.frame = zctjImageView.frame;
    imageView.image = zctjImageView.image;
//    imageView.layer.cornerRadius = imageView.frame.size.height/2;
//    imageView.clipsToBounds = YES;
    [self.view addSubview:imageView];
//    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//        imageView.bounds = CGRectMake(0, 0, 20, 20);
//        imageView.center = myMenuBtn.center;
//    } completion:^(BOOL finished) {
//        if (finished) {
//            imageView.alpha = 0;
//        }
//    }];
    [UIView animateWithDuration:1.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        imageView.bounds = CGRectMake(0, 0, 20, 20);
        imageView.center = myMenuBtn.center;
    } completion:^(BOOL finished) {
        imageView.alpha = 0;
        [imageView removeFromSuperview];
    }];
    //判断如果点击的menu在数组里存在 ，就把它的数目加1，加入orderMenu数组
    //如果不存在直接加入orderMenu
    //[_orderedMenu addObject:_selectedMenu];
    BOOL isExist = NO;
    for (OrderMenu *menu in _myMenu) {
        if (_selectedMenu.menuId == menu.orderID) {
            menu.orderMenuNum++;
            isExist = YES;
        }
    }
    if (!isExist) {
        OrderMenu *myMenu = [[OrderMenu alloc]init];
        myMenu.orderID = _selectedMenu.menuId;
        myMenu.orderMenuName = _selectedMenu.menuName;
        myMenu.orderPicName = _selectedMenu.menuPicName;
        myMenu.orderKind = _selectedMenu.menuKind;
        myMenu.orderPice = _selectedMenu.menuPrice;
        myMenu.orderMenuNum = 1;
        myMenu.orderRemark = @"test";
        [_myMenu addObject:myMenu];
    }
    

}




#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    id myMenu = segue.destinationViewController;
    [myMenu setValue:_myMenu forKey:@"myMenuArr"];
    
}


@end
