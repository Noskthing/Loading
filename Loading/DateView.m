//
//  DateView.m
//  Loading
//
//  Created by ml on 16/9/30.
//  Copyright © 2016年 李博文. All rights reserved.
//

#import "DateView.h"

static CGFloat XEdge = 5;

static CGFloat YEdge = 10;

@implementation DateView

-(instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
    UIBezierPath * bgPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(XEdge, YEdge, SelfWidth - 2 * XEdge, SelfHeight - 2 * YEdge) cornerRadius:3];
    [[UIColor redColor] set];
    [bgPath stroke];
}

@end
