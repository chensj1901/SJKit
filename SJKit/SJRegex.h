//
//  SJRegex.h
//  zhitu
//
//  Created by 陈少杰 on 13-8-7.
//  Copyright (c) 2013年 聆创科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SJRegex : NSObject
+(NSArray*)pregmatchAllWithString:(NSString*)string regex:(NSString*)regexStr;
@end

extern NSString *const SJRegexResultString;
extern NSString *const SJRegexMatchString;
extern NSString *const SJRegexAllResultsString;