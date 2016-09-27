//
//  StyleManager.m
//  Loading
//
//  Created by ml on 16/9/27.
//  Copyright © 2016年 李博文. All rights reserved.
//

#import "StyleManager.h"

@implementation StyleManager

+ (instancetype)sharedManager
{
    static StyleManager * manger = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        manger = [[self alloc] init];
    });
    return manger;
}
@end
