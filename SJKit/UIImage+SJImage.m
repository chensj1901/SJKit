//
//  UIImage+SJImage.m
//  zhitu
//
//  Created by 陈少杰 on 14-3-21.
//  Copyright (c) 2014年 聆创科技有限公司. All rights reserved.
//

#import "UIImage+SJImage.h"

#define getImageAllowance 20.f

@implementation UIImage (SJImage)

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
{
    CGFloat numScale = 2;
    
    UIImage *image = self;
    //    assert(insets.left == insets.right);
    NSInteger scaleW = (image.size.width - centerWidth)*0.5 - insets.left;
//    assert(scaleW>=1);//留下宽，告诉可拉伸距离
    
    if(scaleW<1){
        return self;
    }
    
    CGFloat defaultW = image.size.width;
    CGFloat offsetW = (targetWidth - defaultW)*0.5;
    
    CGSize newSize = CGSizeMake(defaultW + offsetW, image.size.height);
    CGRect scaleRect = CGRectMake(insets.left, 0, scaleW, image.size.height);
    CGRect offsetRect = CGRectMake(insets.left, 0, offsetW, image.size.height);
    
    CGImageRef imageRef = CGImageCreateWithImageInRect([image CGImage], CGRectMake(0, 0, offsetRect.origin.x*numScale, image.size.height*numScale));
    UIImage *startImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    
    imageRef = CGImageCreateWithImageInRect([image CGImage], CGRectMake(CGRectGetMinX(scaleRect)*numScale, 0, CGRectGetWidth(scaleRect)*numScale, image.size.height*numScale));
    UIImage *centerImage = [UIImage imageWithCGImage:imageRef];     //中间专门用来拉伸的部分图片
    CGImageRelease(imageRef);
    
    imageRef = CGImageCreateWithImageInRect([image CGImage], CGRectMake(CGRectGetMaxX(scaleRect)*numScale, 0, (image.size.width - CGRectGetMaxX(scaleRect))*numScale, image.size.height*numScale));
    UIImage *endImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    
    UIGraphicsBeginImageContextWithOptions(newSize , NO, 0.0);
    
//    NSInteger num = offsetRect.size.width / scaleRect.size.width + 1;
    
    [startImage drawInRect:CGRectMake(0, 0, offsetRect.origin.x, newSize.height)];
//    for (int i=0; i<num; i++)
//    {
//        [centerImage drawInRect:CGRectMake(offsetRect.origin.x + i*scaleRect.size.width, 0, scaleRect.size.width, scaleRect.size.height)];
        [centerImage drawInRect:CGRectMake(offsetRect.origin.x, 0, offsetW, scaleRect.size.height)];
//    }
    [endImage drawInRect:CGRectMake(CGRectGetMaxX(offsetRect), 0, newSize.width - CGRectGetMaxX(offsetRect), newSize.height)];
    
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // 上面拉伸完左边部分，另一部分交给系统自带的拉伸来处理
    return [newImage resizableImageWithCapInsets:UIEdgeInsetsMake(insets.top, defaultW + offsetW - insets.left, insets.bottom, insets.right)];
}

-(UIImage*)scaleExcludeCenterWithCenterWidth:(CGFloat)centerWidth
                                  targetSize:(CGSize)targetSize
                                   capWidth:(CGFloat)capWidth
                                      capTop:(CGFloat)capTop
                                   capBottom:(CGFloat)capBottom
                                 anchorX:(CGFloat)anchorX
{
    //           |-capWidth-|-lefFill-|-centerWidth-|-rightFill-|-capWidth-|
    //           0          x0        x1            x2          x3         x4
    //
    //  -        0
    //  captop
    //  -        y0
    //  fill
    //  -        y1
    //  capbottom
    //  -        y2
    
    CGFloat targetWidth=targetSize.width;
    CGFloat targetHeight=targetSize.height;
    CGFloat imageScale=self.scale;
    CGFloat x0=capWidth*imageScale;
    CGFloat x1=(self.size.width*imageScale-centerWidth*imageScale)/2;
    CGFloat x2=self.size.width*imageScale/2+centerWidth*imageScale/2;
    CGFloat x3=self.size.width*imageScale-capWidth*imageScale;
    CGFloat x4=self.size.width*imageScale;
    CGFloat y0=capTop*imageScale;
    CGFloat y1=self.size.height*imageScale-capBottom*imageScale;
    CGFloat y2=self.size.height*imageScale;
    
    CGFloat leftFillWidth = (targetSize.width*anchorX-capWidth-centerWidth/2)*imageScale;
    CGFloat rightFillWidth = (targetSize.width*(1-anchorX)-capWidth-centerWidth/2)*imageScale;
    
    
    CGImageRef selfRef=self.CGImage;
    CGImageRef leftImageRef=CGImageCreateWithImageInRect(selfRef, CGRectMake(0, 0, x0, y2));
    UIImage *leftImage=[[UIImage alloc]initWithCGImage:leftImageRef];
    CGImageRelease(leftImageRef);
    
    CGImageRef leftFillImageRef=CGImageCreateWithImageInRect(selfRef, CGRectMake(x0, 0,x1-x0, y2));
    UIImage *leftFillImage=[[UIImage alloc]initWithCGImage:leftFillImageRef];
    CGImageRelease(leftFillImageRef);
    
    
    CGImageRef middleFillImageRef=CGImageCreateWithImageInRect(selfRef, CGRectMake(x1,0,x2-x1, y2));
    UIImage *middleFillImage=[[UIImage alloc]initWithCGImage:middleFillImageRef];
    CGImageRelease(middleFillImageRef);
    
    
    CGImageRef rightFillImageRef=CGImageCreateWithImageInRect(selfRef, CGRectMake(x2, 0,x3-x2, y2));
    UIImage *rightFillImage=[[UIImage alloc]initWithCGImage:rightFillImageRef];
    CGImageRelease(rightFillImageRef);
    
    CGImageRef rightImageRef=CGImageCreateWithImageInRect(selfRef, CGRectMake(x3, 0,x4-x3, y2));
    UIImage *rightImage=[[UIImage alloc]initWithCGImage:rightImageRef];
    CGImageRelease(rightImageRef);
    
    
    UIGraphicsBeginImageContext(CGSizeMake(targetWidth*imageScale, self.size.height*imageScale));
    [leftImage drawInRect:CGRectMake(0, 0,round(x0), y2)];
    [leftFillImage drawInRect:CGRectMake(round(x0), 0,round(leftFillWidth), y2)];
    [middleFillImage drawInRect:CGRectMake(round(x0)+round(leftFillWidth), 0, round(centerWidth*imageScale), y2)];
    [rightFillImage drawInRect:CGRectMake(round(x0)+round(leftFillWidth)+round(centerWidth*imageScale), 0, round(rightFillWidth), y2)];
    [rightImage drawInRect:CGRectMake(round(x0)+round(leftFillWidth)+round(centerWidth*imageScale)+round(rightFillWidth), 0, round(capWidth*imageScale), y2)];
    
    UIImage *fillLeftRightImage=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    CGImageRef fillLeftRightImageRef=fillLeftRightImage.CGImage;
    CGImageRef topImageRef=CGImageCreateWithImageInRect(fillLeftRightImageRef, CGRectMake(0, 0, targetWidth*imageScale, y0));
    UIImage *topImage=[[UIImage alloc]initWithCGImage:topImageRef];
    CGImageRelease(topImageRef);
    
    CGImageRef middleImageRef2=CGImageCreateWithImageInRect(fillLeftRightImageRef, CGRectMake(0, y0, targetWidth*imageScale, y1-y0));
    UIImage *middleImage2=[[UIImage alloc]initWithCGImage:middleImageRef2];
    CGImageRelease(middleImageRef2);
    
    CGImageRef bottomImageRef=CGImageCreateWithImageInRect(fillLeftRightImageRef, CGRectMake(0, y1, targetWidth*imageScale, y2-y1));
    UIImage *bottomImage=[[UIImage alloc]initWithCGImage:bottomImageRef];
    CGImageRelease(bottomImageRef);

    UIGraphicsBeginImageContext(CGSizeMake(round(targetWidth*imageScale), round(targetHeight*imageScale)));
    [topImage drawInRect:CGRectMake(0, 0, round(targetWidth*imageScale), round(y0))];
    [middleImage2 drawInRect:CGRectMake(0, round(y0), round(targetWidth*imageScale), round(targetHeight*imageScale-capTop*imageScale-capBottom*imageScale))];
    [bottomImage drawInRect:CGRectMake(0, round(y0)+round(targetHeight*imageScale-capTop*imageScale-capBottom*imageScale), round(targetWidth*imageScale), targetHeight*imageScale-(round(y0)+round(targetHeight*imageScale-capTop*imageScale-capBottom*imageScale)))];
    
    UIImage *resultImage=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultImage;
}

- (UIImage*)makeRoundCornersWithRadius:(const CGFloat)radius widthBorderColor:(UIColor*)borderColor borderWidth:(CGFloat)borderWidth{
    if (borderWidth > radius) {
        return self;
    }
    
    UIImage *image = self;
    
    // Begin a new image that will be the new image with the rounded corners
    // (here with the size of an UIImageView)
    UIGraphicsBeginImageContextWithOptions(image.size, NO, image.scale);
    
    const CGRect RECT = CGRectMake(0, 0, image.size.width, image.size.height);
    // Add a clip before drawing anything, in the shape of an rounded rect
    
    [borderColor setFill];
    [[UIBezierPath bezierPathWithRoundedRect:RECT cornerRadius:radius] fill];
    
    CGRect interiorBox = CGRectInset(RECT, borderWidth, borderWidth);
    [[UIBezierPath bezierPathWithRoundedRect:interiorBox cornerRadius:radius] addClip];
    // Draw your image
    [image drawInRect:RECT];
    
    // Get the image, here setting the UIImageView image
    //imageView.image
    UIImage* imageNew = UIGraphicsGetImageFromCurrentImageContext();
    
    // Lets forget about that we were drawing
    UIGraphicsEndImageContext();
    
    return imageNew;
}

- (UIImage*)makeRoundCornersWithRadius:(const CGFloat)radius {
    UIImage *image = self;
    
    // Begin a new image that will be the new image with the rounded corners
    // (here with the size of an UIImageView)
    UIGraphicsBeginImageContextWithOptions(image.size, NO, image.scale);
    
    const CGRect RECT = CGRectMake(0, 0, image.size.width, image.size.height);
    // Add a clip before drawing anything, in the shape of an rounded rect
    [[UIBezierPath bezierPathWithRoundedRect:RECT cornerRadius:radius] addClip];
    // Draw your image
    [image drawInRect:RECT];
    
    // Get the image, here setting the UIImageView image
    //imageView.image
    UIImage* imageNew = UIGraphicsGetImageFromCurrentImageContext();
    
    // Lets forget about that we were drawing
    UIGraphicsEndImageContext();
    
    return imageNew;
}

/**
 *	@brief	<#Description#>
 *
 *	@param 	color 	<#color description#>
 *
 *	@return	<#return value description#>
 */
+ (UIImage *)createImageWithColor:(UIColor *)color

{
    CGRect rect = CGRectMake(0.0f, 0.0f, 2.0f, 2.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}

- (UIImage *) imageWithWaterMask:(UIImage*)mask inRect:(CGRect)rect
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 40000
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 4.0)
    {
        UIGraphicsBeginImageContextWithOptions([self size], NO, 0.0); // 0.0 for scale means "scale for device's main screen".
    }
#else
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 4.0)
    {
        UIGraphicsBeginImageContext([self size]);
    }
#endif
    
    //原图
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    //水印图
    [mask drawInRect:rect];
    
    UIImage *newPic = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newPic;
}

- (UIImage *) imageWithTintColor:(UIColor *)tintColor
{
    return [self imageWithTintColor:tintColor blendMode:kCGBlendModeDestinationIn alpha:1];
}

- (UIImage *) imageWithGradientTintColor:(UIColor *)tintColor
{
    return [self imageWithTintColor:tintColor blendMode:kCGBlendModeOverlay alpha:1];
}

-(UIImage *)imageWithTintColor:(UIColor *)tintColor alpha:(CGFloat)alpha{
    return [self imageWithTintColor:tintColor blendMode:kCGBlendModeOverlay alpha:alpha];
}


- (UIImage *) imageWithTintColor:(UIColor *)tintColor blendMode:(CGBlendMode)blendMode alpha:(CGFloat)alpha
{
    //We want to keep alpha, set opaque to NO; Use 0.0f for scale to use the scale factor of the device’s main screen.
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    [[tintColor colorWithAlphaComponent:alpha] setFill];
    CGRect bounds = CGRectMake(0, 0, self.size.width, self.size.height);
    UIRectFill(bounds);
    
    //Draw the tinted image in context
    [self drawInRect:bounds blendMode:blendMode alpha:1.f];
    
    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return tintedImage;
}

-(CGRect)getHasInfoRect{
    CGImageRef inImage = self.CGImage;
    CGContextRef cgctx = [self createARGBBitmapContextSelf];
    
    CGRect resultRect=CGRectMake(0, 0, CGImageGetWidth(inImage), CGImageGetHeight(inImage));
    
    if (cgctx == NULL) {
        return resultRect;
        /* error */
    }
    
    size_t w = CGImageGetWidth(inImage);
    size_t h = CGImageGetHeight(inImage);
    
    size_t x1=w;
    size_t x2=0;
    size_t y1=h;
    size_t y2=0;
    size_t x,y;
    CGRect rect ={{0,0},{w,h}};
    
    CGContextDrawImage(cgctx, rect, inImage);
    
    unsigned char* data = CGBitmapContextGetData (cgctx);
    if (data != NULL) {
        BOOL found=NO;
        
        NSInteger getWidthInfoPointCount=MIN(10, w);
        NSInteger getHeightInfoPointCount=MIN(10, h);
        
        NSInteger wSpace=w/getWidthInfoPointCount;
        NSInteger hSpace=h/getHeightInfoPointCount;
        
        
        for (size_t j=0; j*hSpace<h; j++) {
            
            y=j*hSpace;
            
            for (size_t i=0; i<x1; i++) {
                x=i;

                NSInteger offset = 4*x+4*y*w;
                NSInteger red = data[offset+1];
                NSInteger green = data[offset+2];
                NSInteger blue = data[offset+3];
                
                if (red>getImageAllowance&&red<255-getImageAllowance&&green>getImageAllowance&&green<255-getImageAllowance&&blue>getImageAllowance&&blue<255-getImageAllowance) {
                    x1=(float)i;
                }
            }
        }
        
        
        for (size_t j=0; j*hSpace<h; j++) {
            
            y=j*hSpace;
            
            for (size_t i=w-1; i>x2; i--) {
                x=i;
                
                NSInteger offset = 4*x+4*y*w;
                
                NSInteger red = data[offset+1];
                NSInteger green = data[offset+2];
                NSInteger blue = data[offset+3];
                
                if (red>getImageAllowance&&red<255-getImageAllowance&&green>getImageAllowance&&green<255-getImageAllowance&&blue>getImageAllowance&&blue<255-getImageAllowance) {
                    x2=(float)i;
                }
            }
        }
        
        
        for (size_t i=0; i*wSpace<=w; i++) {
            x=i*wSpace;
            
            for (size_t j=0; j<y1; j++) {
                y=j;
                
                NSInteger offset = 4*x+4*y*w;
                NSInteger red = data[offset+1];
                NSInteger green = data[offset+2];
                NSInteger blue = data[offset+3];
                
                if (red>getImageAllowance&&red<255-getImageAllowance&&green>getImageAllowance&&green<255-getImageAllowance&&blue>getImageAllowance&&blue<255-getImageAllowance) {
                    y1=(float)j;
                }
            }
        }
        
        
        for (size_t i=0; i*wSpace<=w; i++) {
            
            x=i*wSpace;
            
            for (size_t j=h-1; j>y2; j--) {
    
                y=j;
                
                NSInteger offset = 4*x+4*y*w;
                NSInteger red = data[offset+1];
                NSInteger green = data[offset+2];
                NSInteger blue = data[offset+3];
                
                if (red>getImageAllowance&&red<255-getImageAllowance&&green>getImageAllowance&&green<255-getImageAllowance&&blue>getImageAllowance&&blue<255-getImageAllowance) {
                    y2=(float)j;
                }
            }
        }
    }
    
    CGContextRelease(cgctx);
    
    if (data) {
        free(data);
    }
    
    NSArray* features;
    CIImage *ciImage=[[CIImage alloc]initWithImage:self];
    NSString *accuracy=CIDetectorAccuracyLow;
    
    CIDetector *detector=[CIDetector detectorOfType:CIDetectorTypeFace context:nil options:@{CIDetectorAccuracy:accuracy}];
    features= [detector featuresInImage:ciImage];
    
    CGFloat sumX=0;
    CGFloat sumY=0;
    
    for (CIFaceFeature *feature in features) {
        CGRect aRect = feature.bounds;
        aRect.origin.y = h-aRect.origin.y-aRect.size.height;
        
        sumX+=aRect.origin.x+aRect.size.width/2;
        sumY+=aRect.origin.y+aRect.size.height/2;
        
    }
    
    
    CGPoint faceCenter;
    
    if (sumX==0&&sumY==0) {
        faceCenter=CGPointMake((x2+x1)/2, (y2+y1)/2);
    }else{
        faceCenter=CGPointMake(sumX/[features count], sumY/[features count]);
    }
    
    
    CGFloat width=MIN(x2-x1, y2-y1);
    
    CGFloat centerX1,centerX2,centerY1,centerY2;
    
    centerX1=x1+width/2;
    centerX2=x2-width/2;
    centerY1=y1+width/2;
    centerY2=y2-width/2;
    
    if (faceCenter.x>centerX1&&faceCenter.x<centerX2) {
        //        faceCenter.x=(centerX1+centerX2)/2;
    }else{
        faceCenter.x=MAX(faceCenter.x, centerX1);
        faceCenter.x=MIN(faceCenter.x, centerX2);
    }
    
    if (faceCenter.y>centerY1&&faceCenter.y<centerY2) {
        //        faceCenter.y=(centerY1+centerY2)/2;
    }else{
        faceCenter.y=MAX(faceCenter.y, centerY1);
        faceCenter.y=MIN(faceCenter.y, centerY2);
    }
    
    if (x2>x1&&y2>y1&&width>2) {
        resultRect=CGRectMake(ceil(faceCenter.x-width/2)+1, ceil(faceCenter.y-width/2)+1,width-2,width-2);
    }
    
    return resultRect;
}

- (CGContextRef)createARGBBitmapContextSelf {
    CGImageRef inImage=self.CGImage;
    CGContextRef    context = NULL;
    CGColorSpaceRef colorSpace;
    void *          bitmapData;
    NSInteger             bitmapByteCount;
    NSInteger             bitmapBytesPerRow;
    size_t pixelsWide = CGImageGetWidth(inImage);
    size_t pixelsHigh = CGImageGetHeight(inImage);
    bitmapBytesPerRow   = (pixelsWide * 4);
    bitmapByteCount     = (bitmapBytesPerRow * pixelsHigh);
    colorSpace = CGColorSpaceCreateDeviceRGB();
    if (colorSpace == NULL)
    {
        fprintf(stderr, "Error allocating color space\n");
        return NULL;
    }
    bitmapData = malloc( bitmapByteCount );
    
    if (bitmapData == NULL)
    {
        fprintf (stderr, "Memory not allocated!");
        CGColorSpaceRelease( colorSpace );
        return NULL;
    }
    
    context = CGBitmapContextCreate (bitmapData,pixelsWide,pixelsHigh,8,bitmapBytesPerRow,colorSpace, kCGImageAlphaPremultipliedFirst);
    
    if (context == NULL)
    {
        free (bitmapData);
        fprintf (stderr, "Context not created!");
        
    }
    CGColorSpaceRelease( colorSpace );
    return context;
    
}


-(UIImage*)imageWithWarterImage:(UIImage *)warterImage centerPoint:(CGPoint)centerPoint rotate:(CGFloat)rotate scale:(CGFloat)scale{
    
    CGSize thisImageSize=CGSizeMake(CGImageGetWidth(self.CGImage), CGImageGetWidth(self.CGImage));
    
    //翻转y轴
    centerPoint.y=thisImageSize.height-centerPoint.y;
    
    
    CGFloat warterImageWidth=warterImage.size.width*scale;
    CGFloat warterImageHeight=warterImage.size.height*scale;
    
    
    //根据圆心计算原点
    CGFloat objectP=sqrtf(warterImageWidth*warterImageWidth+warterImageHeight*warterImageHeight)/2;
    CGFloat objectRotate=atan2f(warterImageHeight,warterImageWidth);
    CGPoint originPoint=CGPointMake(centerPoint.x-objectP*cosf(rotate+objectRotate), centerPoint.y-objectP*sinf(rotate+objectRotate));
    
    
    //根据原点计算旋转后坐标系中的点
    CGFloat tRotate=atan2f(originPoint.y,originPoint.x);
    CGFloat pLenght=sqrt(originPoint.x*originPoint.x+originPoint.y*originPoint.y);
    CGPoint truePoint=CGPointMake(cosf(tRotate-rotate)*pLenght, sinf(tRotate-rotate)*pLenght);
    CGSize imageSize=CGSizeMake(thisImageSize.width,thisImageSize.height);
    
    UIGraphicsBeginImageContext(CGSizeMake((int)imageSize.width, (int)imageSize.height));
    
    //翻转坐标系，使之向上
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0.0, imageSize.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetAllowsAntialiasing(context, true);
    CGContextSetShouldAntialias(context, true);
    //绘制背景
    CGContextDrawImage(context, CGRectMake(0, 0, thisImageSize.width, thisImageSize.height), self.CGImage);
    
    //绘制水印
    CGContextSaveGState(context);
    CGAffineTransform myAffine =CGAffineTransformRotate(CGAffineTransformIdentity, rotate);
    CGContextConcatCTM(context, myAffine);
    CGContextDrawImage(context, CGRectMake(truePoint.x, truePoint.y, warterImageWidth, warterImageHeight), warterImage.CGImage);
    CGContextRestoreGState(context);
    
    UIImage *resultImage=UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    
    return resultImage;
    
}

-(UIImage *)imageWithMasksInPercent:(UIEdgeInsets)percent usingColor:(UIColor *)color{
    CGFloat width;
    CGFloat height;
    @autoreleasepool {
        CGImageRef i=self.CGImage;
        width=CGImageGetHeight(i);
        height=CGImageGetHeight(i);
    }
    
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    CGContextRef contextRef=UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(contextRef, color.CGColor);
    [self drawInRect:CGRectMake(0, 0, width, height)];
    CGContextAddRect(contextRef, CGRectMake(0, 0, width, height*percent.top));
    CGContextAddRect(contextRef, CGRectMake(0, 0, width*percent.left, height));
    CGContextAddRect(contextRef, CGRectMake(width-width*percent.right,0, width*percent.right, height));
    CGContextAddRect(contextRef, CGRectMake(0, height-height*percent.bottom, width, height*percent.bottom));
    CGContextFillPath(contextRef);
    UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+(UIImage *)quicklyBackgroundImageWithImageName:(NSString *)imageName{
    UIImage *image=[UIImage imageNamed:imageName];
    UIImage *resultImage=[image resizableImageWithCapInsets:UIEdgeInsetsMake(image.size.height/2, image.size.width/2, image.size.height/2, image.size.width/2) resizingMode:UIImageResizingModeStretch];
    return resultImage;
}

-(UIImage*)imageWithGaussianBlurByRadius:(CGFloat)radius{
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *inputImage = [[CIImage alloc] initWithImage:self];
    // create gaussian blur filter
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    [filter setValue:[NSNumber numberWithFloat:radius] forKey:@"inputRadius"];
    // blur image
    CIImage *result = [filter valueForKey:kCIOutputImageKey];
    CGImageRef cgImage = [context createCGImage:result fromRect:[result extent]];
    UIImage *image = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);
    return image;
}


-(UIImage*)imageWithScaledToSize:(CGSize)newSize
{
    CGRect rect;
    UIGraphicsBeginImageContext(CGSizeMake((int)newSize.width, (int)newSize.height));
    if (newSize.width*self.size.height>newSize.height*self.size.width)
    {
        rect=CGRectMake(0,(newSize.height-self.size.height*newSize.width/self.size.width)/2,newSize.width,self.size.height*newSize.width/self.size.width);
    }
    else
    {
        rect=CGRectMake((newSize.width-self.size.width*newSize.height/self.size.height)/2,0,self.size.width*newSize.height/self.size.height,newSize.height);
    }
    [self drawInRect:rect];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)thumbnailImageWithSize:(CGSize)newSize{
    CGRect rect;
    UIGraphicsBeginImageContext(CGSizeMake((int)newSize.width, (int)newSize.height));
    if (newSize.width*self.size.height>newSize.height*self.size.width)
    {
        rect=CGRectMake(0,(newSize.height-self.size.height*newSize.width/self.size.width)/2,newSize.width,self.size.height*newSize.width/self.size.width);
    }
    else
    {
        rect=CGRectMake((newSize.width-self.size.width*newSize.height/self.size.height)/2,0,self.size.width*newSize.height/self.size.height,newSize.height);
    }
    [self drawInRect:rect];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
    
}
/*
-(long)fileLenght{
    int  perMBBytes = 1024*1024;
    
    CGImageRef cgimage = self.CGImage;
    size_t bpp = CGImageGetBitsPerPixel(cgimage);
    size_t bpc = CGImageGetBitsPerComponent(cgimage);
    size_t bytes_per_pixel = bpp / bpc;
    
    CGFloat lPixelsPerMB  = perMBBytes/bytes_per_pixel;
    CGFloat totalPixel = CGImageGetWidth(self.CGImage)*CGImageGetHeight(self.CGImage);
    long totalFileMB =(long)(totalPixel/lPixelsPerMB*1000000.);
    return totalFileMB;
}
*/
@end
