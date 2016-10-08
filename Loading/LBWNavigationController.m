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
    
    
//    self.automaticallyAdjustsScrollViewInsets = NO;
//    
//    [self.navigationBar.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        NSLog(@"%@",NSStringFromClass([obj class]));
//        if ([obj isKindOfClass:NSClassFromString(@"_UIVisualEffectFilterView")])
//        {
//            obj.hidden = YES;
//            UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, -20, self.view.frame.size.width, 64)];
//            view.backgroundColor = RGBA(0, 225, 225, 1);
//            [self.navigationBar insertSubview:view atIndex:0];
//        }
//    }];
//    
//    self.navigationBar.tintColor = RGBA(0, 225, 225, 1);
    [self.navigationBar setBackgroundImage:[self imageWithColor:RGBA(0, 225, 225, 1)]
                       forBarPosition:UIBarPositionAny
                           barMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[UIImage new]];
}

- (UIImage *)imageWithColor:(UIColor *)color{
    
    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}
@end
