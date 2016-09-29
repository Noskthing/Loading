//
//  LBWNavigationController.m
//  Loading
//
//  Created by 李博文 on 16/9/24.
//  Copyright © 2016年 李博文. All rights reserved.
//

#import "LBWNavigationController.h"

@interface LBWNavigationController ()
{
    
}
@end



@implementation LBWNavigationController

-(void)viewDidLoad
{
//    self.navigationBar.hidden = YES;
    
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self.navigationBar.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:NSClassFromString(@"_UINavigationBarBackground")])
        {
            obj.hidden = YES;
            UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, -20, self.view.frame.size.width, 64)];
            view.backgroundColor = RGBA(0, 225, 225, 1);
            [self.navigationBar insertSubview:view atIndex:0];
        }
    }];
    
    self.navigationBar.tintColor = [UIColor whiteColor];
}
@end
