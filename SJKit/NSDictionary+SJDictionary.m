//
//  NSDictionary+SJDictionary.m
//  Gobang
//
//  Created by 陈少杰 on 14/10/14.
//  Copyright (c) 2014年 陈少杰. All rights reserved.
//

#import "NSDictionary+SJDictionary.h"
#import "NSString+SJString.h"

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

-(NSDictionary *)dictionaryWithSign{
    NSMutableDictionary *parameters=[self mutableCopy];
    NSMutableArray *t=[[self allKeys]mutableCopy];
    [t sortUsingComparator:^NSComparisonResult(NSString * obj1, NSString * obj2) {
        return [obj1 compare:obj2 options:NSCaseInsensitiveSearch];
    }];
    
    NSMutableString *sign=[NSMutableString new];
    
    for (NSString *s in t) {
        [sign appendFormat:@"%@ponimei",[self safeObjectForKey:s]];
    }
    [parameters setObject:[sign md5Encode] forKey:@"sign"];
    return parameters;
}

@end
