//
//  LBWNavigationController.m
//  Loading
//
//  Created by 李博文 on 16/9/24.
//  Copyright © 2016年 李博文. All rights reserved.
//

#import "LBWNavigationController.h"

static CGFloat buttonEdge = 35;

@implementation LBWNavigationController

-(void)viewDidLoad
{
    self.navigationBar.hidden = YES;
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    view.backgroundColor = [UIColor colorWithRed:70/255. green:130/255. blue:180/255. alpha:1.];
    [self.view addSubview:view];
    
    
    UIButton * moreBtn = [[UIButton alloc] initWithFrame:CGRectMake(10,(64 - buttonEdge)/2 + 7, buttonEdge, buttonEdge)];
    [moreBtn setImage:[UIImage imageNamed:@"more"] forState:UIControlStateNormal];
    moreBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    [self.view addSubview:moreBtn];
    
    UIButton * addBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 10 - buttonEdge, (64 - buttonEdge)/2 + 7, buttonEdge, buttonEdge)];
    addBtn.imageEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5);
    [addBtn setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    [self.view addSubview:addBtn];
    
    UIImageView * YImage = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 22, 15, 20, 33)];
    YImage.image = [UIImage imageNamed:@"Y"];
    [self.view addSubview:YImage];
    
    UIImageView * NImage = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 + 2 , 15, 20, 33)];
    NImage.image = [UIImage imageNamed:@"N"];
    [self.view addSubview:NImage];
    
}
@end
