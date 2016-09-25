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

#define HEXCOLOR(hex) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0 green:((float)((hex & 0xFF00) >> 8)) / 255.0 blue:((float)(hex & 0xFF)) / 255.0 alpha:1]

static CGFloat buttonEdge = 35;

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
    _dateTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64)];
    _dateTableView.delegate = self;
    _dateTableView.dataSource = self;
    _dateTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _dateTableView.rowHeight = _dateTableView.frame.size.height/6;
    [_dateTableView registerNib:[UINib nibWithNibName:@"DateTableViewCell" bundle:nil] forCellReuseIdentifier:@"DateTableViewCell.h"];
    [self.view addSubview:_dateTableView];
}

-(void)createNavigationUI
{
    /* navigationBat widgets */
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    view.backgroundColor = [UIColor colorWithRed:70/255. green:130/255. blue:180/255. alpha:1.];
    [self.view addSubview:view];
    
    
    UIButton * moreBtn = [[UIButton alloc] initWithFrame:CGRectMake(10,(64 - buttonEdge)/2 + 7, buttonEdge, buttonEdge)];
    [moreBtn addTarget:self action:@selector(moreButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
    [moreBtn setImage:[UIImage imageNamed:@"more"] forState:UIControlStateNormal];
    moreBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    [self.view addSubview:moreBtn];
    
    UIButton * addBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 10 - buttonEdge, (64 - buttonEdge)/2 + 7, buttonEdge, buttonEdge)];
    addBtn.imageEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5);
    [addBtn addTarget:self action:@selector(addButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
    [addBtn setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    [self.view addSubview:addBtn];
    
    UIImageView * YImage = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 22, 15, 20, 33)];
    YImage.image = [UIImage imageNamed:@"Y"];
    [self.view addSubview:YImage];
    
    UIImageView * NImage = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 + 2 , 15, 20, 33)];
    NImage.image = [UIImage imageNamed:@"N"];
    [self.view addSubview:NImage];
    
    /* 侧边栏 */
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(-self.view.frame.size.width/1.5, 64, self.view.frame.size.width/1.5, self.view.frame.size.height - 64)];
    _tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tableView];
}

- (void)moreButtonTouched:(UIButton *)btn
{
    CGRect rect = _tableView.frame;
    rect.origin.x = -(rect.origin.x + self.view.frame.size.width/1.5);
    
    [UIView animateWithDuration:0.5 animations:^{
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
    
    UIColor * color = _colors[indexPath.row];
    cell.backgroundColor = color;
    
    return cell;
    
}

@end
