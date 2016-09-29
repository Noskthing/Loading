//
//  HomeViewController.m
//  Loading
//
//  Created by 李博文 on 16/9/24.
//  Copyright © 2016年 李博文. All rights reserved.
//

#import "HomeViewController.h"
#import "DateTableViewCell.h"
#import "TypeViewController.h"
#import "MoreTableView.h"
#import "DataBaseManager.h"

#define HEXCOLOR(hex) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0 green:((float)((hex & 0xFF00) >> 8)) / 255.0 blue:((float)(hex & 0xFF)) / 255.0 alpha:1]

static CGFloat buttonEdge = 50;

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * _dateTableView;
    
    NSArray * _colors;
    
    UIView * _tableView;
}
@end

@implementation HomeViewController

-(void)viewDidLoad
{
    self.view.backgroundColor = [UIColor blackColor];
    
    [self initProperties];
    
    [self createUI];
    
    [self createNavigationUI];
    
}

- (void)initProperties
{
    _colors = @[HEXCOLOR(0x48D1CC),HEXCOLOR(0xb8f1cc),HEXCOLOR(0xb8f1ed),HEXCOLOR(0xe7dac9),HEXCOLOR(0xFFC0CB),HEXCOLOR(0xDB7093)];
}

- (void)createUI
{
    UIView * segBg = [[UIView alloc] initWithFrame:CGRectMake(0, 64, Width, 50)];
    segBg.backgroundColor = RGBA(0, 225, 225, 1);
    [self.view addSubview:segBg];
    
    UISegmentedControl * seg = [[UISegmentedControl alloc] initWithItems:@[@"倒计时",@"纪念日",@"新计划"]];
    seg.tintColor = [UIColor whiteColor];
    seg.frame = CGRectMake(20, 5, Width - 40, 32);
    seg.selectedSegmentIndex = 0;
    [segBg addSubview:seg];
    
    _dateTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64 + segBg.frame.size.height, Width, Height - segBg.frame.size.height - 64)];
    _dateTableView.backgroundColor = [UIColor blackColor];
    _dateTableView.delegate = self;
    _dateTableView.dataSource = self;
    _dateTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _dateTableView.rowHeight = _dateTableView.frame.size.height/6;
//    [_dateTableView registerNib:[UINib nibWithNibName:@"DateTableViewCell" bundle:nil] forCellReuseIdentifier:@"DateTableViewCell.h"];
    [_dateTableView registerClass:[DateTableViewCell class] forCellReuseIdentifier:@"DateTableViewCell.h"];
    [self.view addSubview:_dateTableView];
}

- (void)createNavigationUI
{
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 70, 40)];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont fontWithName:@"Heavy" size:20];
    label.text = @"VN";
    self.navigationItem.titleView =label;
    
    /* navigationBat widgets */
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    view.backgroundColor = RGBA(82, 115, 133, 1);
    [self.view addSubview:view];
    
    
    UIButton * moreBtn = [[UIButton alloc] initWithFrame:CGRectMake(10,(64 - buttonEdge)/2 + 7, buttonEdge, buttonEdge)];
    [moreBtn addTarget:self action:@selector(moreButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
    [moreBtn setImage:[UIImage imageNamed:@"more"] forState:UIControlStateNormal];
    moreBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:moreBtn];
    
    UIButton * addBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 10 - buttonEdge, (64 - buttonEdge)/2 + 7, buttonEdge, buttonEdge)];
    addBtn.imageEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5);
    [addBtn addTarget:self action:@selector(addButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
    [addBtn setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:addBtn];
    
    UILabel * title = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 50, 10, 100, 44)];
    title.textAlignment = NSTextAlignmentCenter;
    title.font = [UIFont fontWithName:@"Heavy" size:30];
    title.text = @"YN";
    title.textColor = [UIColor whiteColor];
    [view addSubview:title];
    
    /* 侧边栏 */
    _tableView = [[MoreTableView alloc] initWithFrame:CGRectMake(-self.view.frame.size.width/1.5, 64, self.view.frame.size.width/1.5, self.view.frame.size.height - 64)];
    _tableView.backgroundColor = RGBA(214, 230, 181, 1);
    [self.view addSubview:_tableView];
    
}

- (void)moreButtonTouched:(UIButton *)btn
{
    CGRect rect = _tableView.frame;
    rect.origin.x = -(rect.origin.x + self.view.frame.size.width/1.5);
    
    [UIView animateWithDuration:0.25 animations:^{
        _tableView.frame = rect;
    } completion:^(BOOL finished) {
        [btn setImage:[UIImage imageNamed:rect.origin.x == 0?@"back":@"more"] forState:UIControlStateNormal];
    }];
}

- (void)addButtonTouched:(UIButton *)btn
{
    TypeViewController * vc = [[TypeViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark UITableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    DateTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"DateTableViewCell.h" forIndexPath:indexPath];
    
    
//    UIColor * color = _colors[indexPath.row];
//    cell.backgroundColor = indexPath.row%2 == 0?RGBA(115, 132, 122, 1):RGBA(99, 115, 66, 1);

    return cell;
    
}

@end
