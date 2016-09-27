//
//  StyleManager.h
//  Loading
//
//  Created by ml on 16/9/27.
//  Copyright © 2016年 李博文. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface StyleManager : NSObject

@property (nonatomic,strong)UIColor * navigationBarBackgroundColor;



+ (instancetype)sharedManager;

@end
