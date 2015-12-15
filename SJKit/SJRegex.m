//
//  SJRegex.m
//  zhitu
//
//  Created by 陈少杰 on 13-8-7.
//  Copyright (c) 2013年 聆创科技有限公司. All rights reserved.
//

#import "SJRegex.h"
NSString *const SJRegexAllResultsString=@"SJRegexAllResultsString";
NSString *const SJRegexResultString=@"SJRegexResultString";
NSString *const SJRegexMatchString=@"SJRegexMatchString";

@implementation SJRegex
+(NSArray*)pregmatchAllWithString:(NSString*)string regex:(NSString*)regexStr{
    
    //NSRegularExpression类里面调用表达的方法需要传递一个NSError的参数。下面定义一个
    
    NSError *error;
    
    NSMutableArray *result;
    //http+:[^\\s]* 这个表达式是检测一个网址的。
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regexStr options:0 error:&error];
    
    if (regex != nil) {
        result=[[NSMutableArray alloc]init];
        NSTextCheckingResult *firstMatch;
        firstMatch=[regex firstMatchInString:string options:0 range:NSMakeRange(0, [string length])];
        if (!!(firstMatch)) {
            for (NSTextCheckingResult *match in [regex matchesInString:string options:0 range:NSMakeRange(0, string.length)]) {
                
                NSRange resultRange = [match rangeAtIndex:0];
                
                //从urlString当中截取数据
                NSString *resultString=[string substringWithRange:resultRange];
                NSMutableArray *results=[[NSMutableArray alloc]init];
                for (int i=0;i<[match numberOfRanges]; i++) {
                    NSRange range=[match rangeAtIndex:i];
                    [results addObject:[string substringWithRange:range]];
                }
                
                NSDictionary *resultDictionary=[NSDictionary dictionaryWithObjectsAndKeys:resultString,SJRegexResultString,match,SJRegexMatchString,results,SJRegexAllResultsString,nil];
                [result addObject:resultDictionary];
                
            }
        }
        
    }
    return result;
}
@end
