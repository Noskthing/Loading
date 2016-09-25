//
//  DateTableViewCell.m
//  Loading
//
//  Created by 李博文 on 16/9/24.
//  Copyright © 2016年 李博文. All rights reserved.
//

#import "DateTableViewCell.h"

@implementation DateTableViewCell

- (void)awakeFromNib {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
