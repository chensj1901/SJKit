//
//  NSArray+SJArray.m
//  zhitu
//
//  Created by 陈少杰 on 14-3-26.
//  Copyright (c) 2014年 聆创科技有限公司. All rights reserved.
//

#import "NSArray+SJArray.h"

@implementation NSArray (SJArray)
-(NSString*)stringValue{
    NSData* jsonData =[NSJSONSerialization dataWithJSONObject:self
                                                      options:NSJSONWritingPrettyPrinted error:nil];
    //print out the data contents
    NSString *string=[[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    return string;
}

-(NSArray *)splitterWithFormatString:(NSString*)formatString{
    NSMutableArray *results=[[NSMutableArray alloc]init];
    NSArray *numControl=[formatString componentsSeparatedByString:@","];
    BOOL isInit=[results count]>0;
    NSInteger i=isInit?[results count]-1:0;
    for (id obj in self) {
        if (!isInit) {
            NSMutableArray *t=[[NSMutableArray alloc]init];
            [results addObject:t];
            isInit=YES;
        }
        if ([[results objectAtIndex:i]count]<(i<[numControl count]?[[numControl objectAtIndex:i]integerValue]:[[numControl lastObject]integerValue])) {
            [[results lastObject]addObject:obj];
        }
        else{
            i++;
            NSMutableArray *t=[[NSMutableArray alloc]init];
            [results addObject:t];
            [[results lastObject]addObject:obj];
            
        }
    }
    return results;
}

-(id)safeObjectAtIndex:(NSUInteger)index{
    id result=nil;
    if ([self count]>index) {
      result =   [self objectAtIndex:index];
    }
    return result;
}

-(id)getObjectWithBlock: (BOOL(^)(id obj))block{
    if (block) {
        id result=nil;
        for (id objE in self) {
            if (block(objE)) {
                result=objE;
                break;
            }
        }
        return result;
    }
    return nil;
}
-(NSUInteger)getObjectIndexWithBlock: (BOOL(^)(id obj))block{
    if (block) {
        NSUInteger result=-1;
        for (NSUInteger i=0;i<[self count];i++) {
            id objE=[self safeObjectAtIndex:i];
            if (block(objE)) {
                result=i;
                break;
            }
        }
        return result;
    }
    return -1;
}
@end
