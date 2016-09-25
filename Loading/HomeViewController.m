//
//  HomeViewController.m
//  Loading
//
//  Created by 李博文 on 16/9/24.
//  Copyright © 2016年 李博文. All rights reserved.
//

#import "HomeViewController.h"
#import "DateTableViewCell.h"


#define HEXCOLOR(hex) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0 green:((float)((hex & 0xFF00) >> 8)) / 255.0 blue:((float)(hex & 0xFF)) / 255.0 alpha:1]

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * _dateTableView;
    
    NSArray * _colors;
}
@end

@implementation HomeViewController

-(void)viewDidLoad
{
    [self initProperties];
    
    [self createUI];
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
