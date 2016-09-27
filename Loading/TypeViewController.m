//
//  TypeViewController.m
//  Loading
//
//  Created by 李博文 on 2016/9/25.
//  Copyright © 2016年 李博文. All rights reserved.
//

#import "TypeViewController.h"
#import "EventTextFiled.h"

@interface TypeViewController ()
{
    NSArray * _titles;
    
    EventTextFiled * _textFiled;
}
@end

static CGFloat buttonEdge = 50;

@implementation TypeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

    [self createNavigationUI];
    
    [self createUI];
}

- (void)createUI
{
    self.view.backgroundColor = RGBA(206, 214, 173, 1);
    
    _titles = @[@"倒计时",@"纪念日",@"新计划",@"更多"];
    
    CGFloat width = self.view.frame.size.width/_titles.count;
    
    for (int i = 0; i< _titles.count; i++)
    {
        UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(i * width, 64, width, width + 20)];
        button.backgroundColor = RGBA(197, 223, 222, 1);
    
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, width - 30, width - 30)];
        imageView.image = [UIImage imageNamed:_titles[i]];
        [button addSubview:imageView];
        
        UILabel * title = [[UILabel alloc] initWithFrame:CGRectMake(0, width - 15, width, 20)];
        title.text = _titles[i];
        title.textColor = [UIColor whiteColor];
        title.font = [UIFont systemFontOfSize:11];
        title.textAlignment = NSTextAlignmentCenter;
        [button addSubview:title];
        
        [self.view addSubview:button];
    }
    
    _textFiled = [[EventTextFiled alloc] initWithFrame:CGRectMake(10, 64 + self.view.frame.size.width/_titles.count + 20 + 10, self.view.frame.size.width - 20, 50)];
    [self.view addSubview:_textFiled];
//    [self.view addSubview:[self countDownView]];
}

- (UIView *)countDownView
{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 64 + self.view.frame.size.width/_titles.count + 20, self.view.frame.size.width, 100)];
//    view.backgroundColor =
    
    
    return view;
}

- (void)createNavigationUI
{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    view.backgroundColor = RGBA(82, 115, 133, 1);
    [self.view addSubview:view];
    
    UIButton * backBtn = [[UIButton alloc] initWithFrame:CGRectMake(10,(64 - buttonEdge)/2 + 7, buttonEdge, buttonEdge)];
    [backBtn addTarget:self action:@selector(backButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setImage:[UIImage imageNamed:@"navBack"] forState:UIControlStateNormal];
    backBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    [self.view addSubview:backBtn];
    
    UIButton * saveBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 10 - buttonEdge, (64 - buttonEdge)/2 + 7, buttonEdge, buttonEdge)];
    saveBtn.imageEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5);
    [saveBtn addTarget:self action:@selector(saveButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
    [saveBtn setImage:[UIImage imageNamed:@"save"] forState:UIControlStateNormal];
    [self.view addSubview:saveBtn];
}

- (void)backButtonTouched:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)saveButtonTouched:(UIButton *)btn
{
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch * touche = [touches anyObject];
    CGPoint point = [touche locationInView:self.view];
    
    if (!CGRectContainsPoint(_textFiled.frame, point))
    {
        [_textFiled resignFirstResponder];
    }
}
@end
