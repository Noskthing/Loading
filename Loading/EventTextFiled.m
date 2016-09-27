//
//  EventTextFiled.m
//  Loading
//
//  Created by ml on 16/9/27.
//  Copyright © 2016年 李博文. All rights reserved.
//

#import "EventTextFiled.h"

@interface EventTextFiled ()<UITextFieldDelegate>
{
    UILabel * _placeHolderLabel;
    
    UITextField * _textFiled;
}
@end

@implementation EventTextFiled

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = RGBA(255, 255, 255, 0.3);
        
        _textFiled = [[UITextField alloc] initWithFrame:CGRectMake(10, frame.size.height/2 - 15, frame.size.width - 20, 30)];
        _textFiled.delegate = self;
        _textFiled.textAlignment = NSTextAlignmentCenter;
        _textFiled.font = [UIFont fontWithName:@"Heavy" size:15];
        _textFiled.textColor = RGBA(0, 0, 0, 0.75);
        [self addSubview:_textFiled];
        
        _placeHolderLabel = [[UILabel alloc] initWithFrame:_textFiled.frame];
        _placeHolderLabel.textAlignment = NSTextAlignmentCenter;
        _placeHolderLabel.font = [UIFont fontWithName:@"Heavy" size:15];
        _placeHolderLabel.text = @"输入记录事件";
        _placeHolderLabel.textColor = RGBA(0, 0, 0, 0.5);
        [self addSubview:_placeHolderLabel];
    }
    return self;
}


#pragma mark     textFiled delegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    _placeHolderLabel.text = @"";
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField.text.length == 0)
    {
        _placeHolderLabel.text = @"输入记录事件";
    }
}

-(NSString *)eventName
{
    return _textFiled.text;
}

-(void)resignFirstResponder
{
    [_textFiled resignFirstResponder];
}
@end
