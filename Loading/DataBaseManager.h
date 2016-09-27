//
//  DataBaseManager.h
//  Loading
//
//  Created by ml on 16/9/27.
//  Copyright © 2016年 李博文. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataBaseManager : NSObject

+ (instancetype)sharedManager;

- (void)saveCountDownEntity;

- (void)test;
@end
