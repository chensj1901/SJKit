//
//  NSFileManager+SJFileManager.h
//  tBook
//
//  Created by 陈少杰 on 14/12/1.
//  Copyright (c) 2014年 陈少杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (SJFileManager)

/**
 *	@brief	获取文件在沙盒的位置
 *
 *	@param 	fileName 	文件名
 *
 *	@return	文件在沙盒的document路径
 */
+(NSString*)getFilePath:(NSString*)fileName;

/**
 *	@brief	获取缓存文件在沙盒的位置
 *
 *	@param 	fileName 	文件名
 *
 *	@return	文件在沙盒的cache的路径
 */
+(NSString*)getTempFilePath:(NSString*)fileName;


/**
 *	@brief	检测文件是否存在
 *
 *	@param 	filename 	文件名
 *
 *	@return	yes／no
 */
+(BOOL)isFileExists:(NSString*)filename;

/**
 *	@brief	检测缓存文件是否存在
 *
 *	@param 	filename 	文件名
 *
 *	@return	yes／no
 */
+(BOOL)isTempFileExists:(NSString*)filename;

/**
 *	@brief	复制文件
 *
 *	@param 	originFilePath 	源文件
 *	@param 	destinationFilePath 	目标文件
 */
+(void)copyFileFromFilePath:(NSString*)originFilePath toFilePath:(NSString*)destinationFilePath;
@end
