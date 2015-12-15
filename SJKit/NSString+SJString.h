//
//  NSString+SJString.h
//  Gobang
//
//  Created by 陈少杰 on 14-10-14.
//  Copyright (c) 2014年 陈少杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SJString)
-(id)objectValue;
-(NSString *)URLString ;
-(NSString *)aliasDecode ;
-(NSString*)sqliteStr;
-(NSString*)dateFormat;
-(NSString*)md5Encode;
-(NSArray *)intelligentWordRangeWithBeginLocation:(NSUInteger)location;
-(NSString *)stringWithTrim;
@end
