//
//  NSDictionary+SJDictionary.h
//  Gobang
//
//  Created by 陈少杰 on 14/10/14.
//  Copyright (c) 2014年 陈少杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (SJDictionary)
-(NSString*)stringValue;
-(id)safeObjectForKey:(id)key;
@end
