//
//  SJCell.m
//  Yunpan
//
//  Created by 陈少杰 on 15/11/10.
//  Copyright © 2015年 陈少杰. All rights reserved.
//

#import "SJCell.h"

@implementation SJCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        self.backgroundColor=[UIColor clearColor];
    }
    return self;
}
@end
