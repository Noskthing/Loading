//
//  MoreTableView.m
//  Loading
//
//  Created by ml on 16/9/26.
//  Copyright © 2016年 李博文. All rights reserved.
//

#import "MoreTableView.h"
#import "MoreTableViewCell.h"

@interface MoreTableView ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray * _titles;
}
@end

@implementation MoreTableView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        _titles = @[@"公告",@"用法",@"打赏",@"联系我们",@"关于作者",@"喜欢这个App"];
        
        self.delegate = self;
        self.dataSource = self;
        
        self.rowHeight = (frame.size.height - frame.size.width * 0.35)/_titles.count;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self registerNib:[UINib nibWithNibName:@"MoreTableViewCell" bundle:nil] forCellReuseIdentifier:@"MoreTableView"];
        
        /* footerView */
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.width * 0.35)];
        view.backgroundColor = [UIColor greenColor];
        self.tableFooterView = view;
    }
    return self;
}

#pragma mark     delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MoreTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"MoreTableView" forIndexPath:indexPath];
    
    cell.title.text = _titles[indexPath.row];
//    cell.backgroundColor = RGBA(148, 213, 205, 1);
    
    return cell;
}

@end
