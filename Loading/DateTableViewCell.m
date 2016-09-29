//
//  DateTableViewCell.m
//  Loading
//
//  Created by 李博文 on 16/9/24.
//  Copyright © 2016年 李博文. All rights reserved.
//

#import "DateTableViewCell.h"
#import "ProgressView.h"

@interface DateTableViewCell ()
{
    ProgressView * _progressView;
    
    UILabel * _titleLabel;
    
    UILabel * _dateLabel;
}
@end

@implementation DateTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    NSLog(@"aaa");
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        _progressView = [[ProgressView alloc] init];
        [self addSubview:_progressView];
        
        _titleLabel = [[UILabel alloc] init];
//        _titleLabel.backgroundColor = [UIColor redColor];
        _titleLabel.text = @"Appointment with Dr Husaar";
        [self addSubview:_titleLabel];
        
        _dateLabel = [[UILabel alloc] init];
//        _dateLabel.backgroundColor = [UIColor greenColor];
        _dateLabel.text = @"Date:05/07/15";
        _dateLabel.font = [UIFont systemFontOfSize:12];
        _dateLabel.textColor = [UIColor grayColor];
        [self addSubview:_dateLabel];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    _titleLabel.frame = CGRectMake(SelfHeight, SelfHeight/4 - 3, SelfWidth - SelfHeight, SelfHeight/4);
    _dateLabel.frame = CGRectMake(SelfHeight, SelfHeight/2 + 3, SelfWidth - SelfHeight, SelfHeight/4);
    _progressView.frame = CGRectMake(0, 0, SelfHeight, SelfHeight);
}
@end
