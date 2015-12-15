//
//  NSFileManager+SJFileManager.m
//  tBook
//
//  Created by 陈少杰 on 14/12/1.
//  Copyright (c) 2014年 陈少杰. All rights reserved.
//

#import "NSFileManager+SJFileManager.h"

@implementation NSFileManager (SJFileManager)

+(NSString*)getFilePath:(NSString*)fileName{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectroy = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectroy stringByAppendingPathComponent:fileName];
    return filePath;
}


+(NSString*)getTempFilePath:(NSString*)fileName{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectroy = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectroy stringByAppendingPathComponent:fileName];
    //    SJLog(@"%@",filePath);
    return filePath;
}

+(BOOL)isFileExists:(NSString*)filename{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    return [fileManager fileExistsAtPath:[self getFilePath:filename]];
}


+(BOOL)isTempFileExists:(NSString*)filename{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    return [fileManager fileExistsAtPath:[self getTempFilePath:filename]];
}


+(void)copyFileFromFilePath:(NSString *)originFilePath toFilePath:(NSString *)destinationFilePath{
    NSData *mainBundleFile = [NSData dataWithContentsOfFile:originFilePath];
    
    [[NSFileManager defaultManager] createFileAtPath:destinationFilePath
                                            contents:mainBundleFile
                                          attributes:nil];
}
@end
