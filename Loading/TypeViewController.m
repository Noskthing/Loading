//
//  TypeViewController.m
//  Loading
//
//  Created by 李博文 on 2016/9/25.
//  Copyright © 2016年 李博文. All rights reserved.
//

#import "TypeViewController.h"

@interface TypeViewController ()

@end

@implementation TypeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.navigationController performSelector:@selector(popViewControllerAnimated:) withObject:@(YES) afterDelay:2.];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
