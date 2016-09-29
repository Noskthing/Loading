//
//  ProgressView.m
//  Loading
//
//  Created by ml on 16/9/29.
//  Copyright © 2016年 李博文. All rights reserved.
//

#import "ProgressView.h"

static CGFloat space = 12;
@implementation ProgressView

-(instancetype)init
{
    if (self = [super init])
    {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
    UIBezierPath *bgPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(space, space, SelfWidth - 2 * space, SelfHeight - 2 * space)];
    [[UIColor lightGrayColor] set];
    [bgPath setLineWidth:.5];
    [bgPath stroke];
    
    CGFloat edgeRadius = (SelfHeight - 2 * space)/2;
    
    CGFloat scale = 0.97;
    
    UIBezierPath * edgeBgPath = [UIBezierPath bezierPath];
    [edgeBgPath addArcWithCenter:self.center
                          radius:edgeRadius
                      startAngle: 0
                        endAngle: M_PI_2 * (4 - 4 * scale)
                       clockwise:NO];
    [RGBA(0, 225, 225, 1) set];
    [edgeBgPath setLineWidth:.5];
    [edgeBgPath stroke];
    
    NSString * str = @"97";
//    [str drawAtPoint:CGPointMake(SelfWidth/4, SelfHeight * 2/7) withAttributes:@{NSForegroundColorAttributeName:[UIColor redColor],NSFontAttributeName:[UIFont systemFontOfSize:18]}];
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    [style setAlignment:NSTextAlignmentLeft];
    [str drawInRect:CGRectMake(space + 8, space + 12, SelfWidth - 2 * space, SelfHeight - 2 * space) withAttributes:@{NSForegroundColorAttributeName:RGBA(0, 225, 225, 1),NSFontAttributeName:[UIFont systemFontOfSize:22],NSParagraphStyleAttributeName:style}];
    
    NSString * pass = @"%";
    NSMutableParagraphStyle * style1 = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    [style1 setAlignment:NSTextAlignmentRight];
    [pass drawInRect:CGRectMake(SelfWidth - space - 18, SelfHeight - 40, SelfWidth - 2 * space, SelfHeight - 2 * space) withAttributes:@{NSForegroundColorAttributeName:RGBA(0, 225, 225, 1),NSFontAttributeName:[UIFont systemFontOfSize:10],NSParagraphStyleAttributeName:style}];
}
@end
