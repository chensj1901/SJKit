//
//  NSDictionary+SJDictionary.m
//  Gobang
//
//  Created by 陈少杰 on 14/10/14.
//  Copyright (c) 2014年 陈少杰. All rights reserved.
//

#import "NSDictionary+SJDictionary.h"

@implementation NSDictionary (SJDictionary)
-(NSString*)stringValue{
    NSData* jsonData =[NSJSONSerialization dataWithJSONObject:self
                                                      options:NSJSONWritingPrettyPrinted error:nil];
    //print out the data contents
    NSString *string=[[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    return string;
}


-(id)safeObjectForKey:(id)key{
    id result = [self objectForKey:key];
    
    if (![result isKindOfClass:[NSNull class]]) {
        return result;
    }
    
    return nil;
}
@end
