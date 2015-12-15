//
//  SJFunction.h
//  tBook
//
//  Created by 陈少杰 on 14/11/24.
//  Copyright (c) 2014年 陈少杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SJFunction : NSObject
void alert(NSString* string);
void alerttop(NSString* string);
+(NSString *)dateFormat:(NSTimeInterval)date;
@end
