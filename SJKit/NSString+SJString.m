//
//  NSString+SJString.m
//  Gobang
//
//  Created by 陈少杰 on 14-10-14.
//  Copyright (c) 2014年 陈少杰. All rights reserved.
//

#import "NSString+SJString.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (SJString)
-(id)objectValue{
    NSError *error;
    id jsonData=[NSJSONSerialization JSONObjectWithData:[self dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
    return jsonData;
}

-(NSString *)sqliteStr{
    NSMutableString *result;
    result=[[NSMutableString alloc]initWithString:self];
    [result replaceOccurrencesOfString:@"'" withString:@"''" options:NSCaseInsensitiveSearch range:NSMakeRange(0, result.length)];
    return result;
}

- (NSString *)URLString {
    NSString *ret = self;
    char *src = (char *)[self UTF8String];
    
    if (NULL != src) {
        NSMutableString *tmp = [NSMutableString string];
        int ind = 0;
        
        while (ind < strlen(src)) {
            if (src[ind] < 0
                || (' ' == src[ind]
                    || ':' == src[ind]
                    || '/' == src[ind]
                    || '%' == src[ind]
                    || '#' == src[ind]
                    || ';' == src[ind]
                    || '@' == src[ind]
                    || '=' == src[ind]
                    || '&' == src[ind]))
            {
#if UE_DEBUG
                NSLog(@"escapedURLString: src[%d] = %d", ind, src[ind]);
#endif
                [tmp appendFormat:@"%%%X", (unsigned char)src[ind++]];
            }
            else
            {
                [tmp appendFormat:@"%c", src[ind++]];
            }
        }
        
        ret = tmp;
        
#if UE_DEBUG
        NSLog(@"Escaped string = %@", tmp);
#endif
    }
    
    return ret;
}
-(NSString *)aliasDecode{
    NSMutableString *aliasEncode=[NSMutableString stringWithString:self];
    [aliasEncode replaceOccurrencesOfString:@"_" withString:@"%" options:0 range:NSMakeRange(0, aliasEncode.length)];
    [aliasEncode deleteCharactersInRange:NSMakeRange(aliasEncode.length-4, 4)];
    NSString *alias=nil;
    while (alias==nil&&aliasEncode.length>10) {
        alias=[aliasEncode stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        NSUInteger pos=[aliasEncode rangeOfString:@"%" options:NSBackwardsSearch range:NSMakeRange(0, aliasEncode.length)].location;
        [aliasEncode deleteCharactersInRange:NSMakeRange(pos, aliasEncode.length-pos)];
    }
    return alias;
}

-(NSString*)dateFormat{
NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
[dateFormat setDateFormat:@"yyyyMMdd"];
 return  [self stringByAppendingString:[dateFormat stringFromDate:[NSDate date]]];
}

-(NSString *)md5Encode{
    
	const char *cStr = [self UTF8String];
    unsigned char result[16];
    
    if (!self) {
        return @"";
    }
    
    CC_LONG strl=(CC_LONG)strlen(cStr);
    CC_MD5( cStr, strl , result ); // This is the md5 call
    NSString *re=[NSString stringWithFormat:
                  @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                  result[0], result[1], result[2], result[3],
                  result[4], result[5], result[6], result[7],
                  result[8], result[9], result[10], result[11],
                  result[12], result[13], result[14], result[15]
                  ];
    re=[re uppercaseString];
    return re;
}


-(NSArray *)intelligentWordRangeWithBeginLocation:(NSUInteger)location{
    int intellLength=300;
    
    NSMutableArray *result=[[NSMutableArray alloc]init];
    NSArray *ns=[[self substringFromIndex:location]componentsSeparatedByString:@"\n"];
    NSMutableString *subP=[[NSMutableString alloc]init];
    for (int j=0;j< [ns count];j++) {
        NSString *p;
        if (j!=[ns count]-1) {
            p =[ns[j]stringByAppendingString:@"\n"];
        }else{
            p=ns[j];
        }
        if (subP.length+p.length<intellLength) {
            [subP appendString:p];
            if (j==[ns count]-1) {
//                [result addObject:[NSValue valueWithRange:[self rangeOfString:subP]]];
                [self addStringRangeToArray:result withString:subP];
            }
        }else if (p.length<intellLength) {
//            [result addObject:[NSValue valueWithRange:[self rangeOfString:subP]]];
            [self addStringRangeToArray:result withString:subP];
            subP=[[NSMutableString alloc]initWithString:p];
            if (j==[ns count]-1) {
//                [result addObject:[NSValue valueWithRange:[self rangeOfString:subP]]];
                [self addStringRangeToArray:result withString:subP];
            }
        }else{
//            [result addObject:[NSValue valueWithRange:[self rangeOfString:subP]]];
            [self addStringRangeToArray:result withString:subP];
            subP=[[NSMutableString alloc]init];
            NSArray *ps=[p componentsSeparatedByString:@"。"];
            NSMutableString *subString=[[NSMutableString alloc]init];
            for (int i=0; i<[ps count];i++) {
                
                NSString *thisStr;
                if (i!=[ps count]-1) {
                    thisStr=[ps[i] stringByAppendingString:@"。"];
                }else{
                    thisStr=ps[i];
                }
                if (subString.length+thisStr.length<intellLength) {
                    [subString appendString:thisStr];
                    if (i==[ps count]-1) {
//                        [result addObject:[NSValue valueWithRange:[self rangeOfString:subString]]];
                        [self addStringRangeToArray:result withString:subString];
                    }
                }else if (thisStr.length<intellLength){
//                    [result addObject:[NSValue valueWithRange:[self rangeOfString:subString]]];
                    
                    [self addStringRangeToArray:result withString:subString];
                    
                    if (i==[ps count]-1) {
//                        [result addObject:[NSValue valueWithRange:[self rangeOfString:thisStr]]];
                        
                        [self addStringRangeToArray:result withString:thisStr];
                    }else{
                        subString=[NSMutableString stringWithString:thisStr];
                    }
                }else{
                    
//                    if (subString.length>0) {
//                        [result addObject:[NSValue valueWithRange:[self rangeOfString:subString]]];
//                    }

                    
                    [self addStringRangeToArray:result withString:subString];
                    
                    NSInteger thisStrCount=thisStr.length/intellLength;
                    for (int ii=0; ii<thisStrCount; ii++) {
                        NSString *middleStr=[thisStr substringWithRange:NSMakeRange(ii*intellLength, intellLength)];
//                        [result addObject:[NSValue valueWithRange:[self rangeOfString:middleStr]]];
                        [self addStringRangeToArray:result withString:middleStr];
                    }
                    
                    if (i==[ps count]-1) {
                        NSString *tailStr=[thisStr substringFromIndex:thisStrCount*intellLength];
//                        [result addObject:[NSValue valueWithRange:[self rangeOfString:tailStr]]];
                        [self addStringRangeToArray:result withString:tailStr];
                    }else{
                        subString=[NSMutableString stringWithString:[thisStr substringFromIndex:thisStrCount*intellLength]];
                    }
                }
            }
        }
    }
    return result;
}

-(void)addStringRangeToArray:(NSMutableArray*)array withString:(NSString *)string{
    if (string.length>0) {
        
        [array addObject:[NSValue valueWithRange:[self rangeOfString:string]]];
   
    }
}

-(NSString *)stringWithTrim{
    NSString *cleanString = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return cleanString;
}


@end
