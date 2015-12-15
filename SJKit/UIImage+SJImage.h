//
//  UIImage+SJImage.h
//  zhitu
//
//  Created by 陈少杰 on 14-3-21.
//  Copyright (c) 2014年 聆创科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SJImage)

/**
 *	@brief	左右两边平均拉伸图片
 *
 *	@param  centerWidth 中间不被拉伸的宽度
 *	@param  targetWidth 图片最后目标的宽度
 *	@param  resizableImageWithCapInsets 不被拉伸的其它区域
 *
 *	@return	拉伸过后的图片
 */
- (UIImage*)scaleExcludeCenterWithCenterWidth:(CGFloat)centerWidth targetWidth:(CGFloat)targetWidth
                                    capInsets:(UIEdgeInsets)insets;
+ (UIImage *) createImageWithColor:(UIColor *)color;
- (UIImage *) imageWithWaterMask:(UIImage*)mask inRect:(CGRect)rect;
- (UIImage *) imageWithTintColor:(UIColor *)tintColor alpha:(CGFloat)alpha;
- (UIImage *) imageWithTintColor:(UIColor *)tintColor;
- (UIImage *) imageWithTintColor:(UIColor *)tintColor blendMode:(CGBlendMode)blendMode alpha:(CGFloat)alpha;
- (UIImage *) imageWithGradientTintColor:(UIColor *)tintColor;
- (UIImage *) imageWithWarterImage:(UIImage *)warterImage centerPoint:(CGPoint)centerPoint rotate:(CGFloat)rotate scale:(CGFloat)scale;
- (UIImage *) imageWithMasksInPercent:(UIEdgeInsets)percent usingColor:(UIColor *)color;
- (UIImage*)scaleExcludeCenterWithCenterWidth:(CGFloat)centerWidth
                        targetSize:(CGSize)targetSize
                          capWidth:(CGFloat)capWidth
                            capTop:(CGFloat)capTop
                         capBottom:(CGFloat)capBottom
                           anchorX:(CGFloat)anchorX;
+ (UIImage *) quicklyBackgroundImageWithImageName:(NSString *)imageName;
- (CGRect) getHasInfoRect;
- (UIImage*)imageWithGaussianBlurByRadius:(CGFloat)radius;
-(UIImage*)imageWithScaledToSize:(CGSize)newSize;
- (UIImage*)makeRoundCornersWithRadius:(const CGFloat)radius;
- (UIImage*)makeRoundCornersWithRadius:(const CGFloat)radius widthBorderColor:(UIColor*)borderColor borderWidth:(CGFloat)borderWidth;
//@property(nonatomic,readonly)long fileLenght;
@end
