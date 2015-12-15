//
//  NSArray+SJArray.h
//  zhitu
//
//  Created by 陈少杰 on 14-3-26.
//  Copyright (c) 2014年 聆创科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (SJArray)
/*
 *prarma formatString 格式化字符串 如4,2,1就是指数组第一项4个值，第二项2个值，第三项以后均为1个值
 */
-(NSArray *)splitterWithFormatString:(NSString*)formatString;
-(id)safeObjectAtIndex:(NSUInteger)index;
-(NSString*)stringValue;
-(id)getObjectWithBlock: (BOOL(^)(id obj))block;
-(NSUInteger)getObjectIndexWithBlock: (BOOL(^)(id obj))block;
@end
