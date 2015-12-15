//
//  SJImgaeLabel.m
//  zhitu
//
//  Created by 陈少杰 on 14-1-17.
//  Copyright (c) 2014年 聆创科技有限公司. All rights reserved.
//

#import "SJImageLabel.h"
#import "SJKit.h"

@implementation SJImageLabel
-(id)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [self.textLabel addObserver:self forKeyPath:@"text" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
        [self.textLabel addObserver:self forKeyPath:@"attributedText" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
        [self.textLabel addObserver:self forKeyPath:@"font" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
        [self.imageView addObserver:self forKeyPath:@"image" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
        [self addObserver:self forKeyPath:@"frame" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
        self.isAutoImageSize=YES;
        
    }
    return self;
}


-(UILabel *)textLabel{
    if (!_textLabel) {
        _textLabel=[[UILabel alloc]initWithFrame:CGRectZero];
        _textLabel.backgroundColor=[UIColor clearColor];
        [self addSubview:_textLabel];
    }
    return _textLabel;
}

-(UIImageView *)imageView{
    if (!_imageView) {
        _imageView=[[UIImageView alloc]initWithFrame:CGRectZero];
        _imageView.backgroundColor=[UIColor clearColor];
        [self addSubview:_imageView];
        
    }
    return _imageView;
}
-(void)setImagePostion:(SJImageLabelImagePosition)imagePostion{
    _imagePostion=imagePostion;
    [self observeValueForKeyPath:NULL ofObject:nil change:nil context:nil]; 
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    CGSize textSize=[self.textLabel.text sizeWithFont:self.textLabel.font];
    CGSize imageSize=self.isAutoImageSize?self.imageView.image.size:self.imageView.bounds.size;
    CGSize selfSize=self.bounds.size;
    CGFloat paddingY=ABS(textSize.height-imageSize.height)/2;
    CGFloat paddingVertical = self.verticalCenter?(selfSize.height - textSize.height)*0.5:0;
    
    switch (self.imagePostion) {
        case SJImageLabelImagePositionLeft:{
            CGFloat textWidth=MIN((self.bounds.size.width-imageSize.width-self.padding),textSize.width);
            switch (self.textLabel.textAlignment) {
                case NSTextAlignmentCenter:
                    if (textSize.height>imageSize.height) {
                        self.imageView.frame=CGRectMake((selfSize.width-imageSize.width-textWidth-self.padding)/2, paddingY + paddingVertical, imageSize.width, imageSize.height);
                        self.textLabel.frame=CGRectMake((selfSize.width-imageSize.width-textWidth-self.padding)/2+imageSize.width+self.padding, paddingVertical, textWidth, textSize.height);
                    }else{
                        self.imageView.frame=CGRectMake((selfSize.width-imageSize.width-textWidth-self.padding)/2, paddingVertical, imageSize.width, imageSize.height);
                        self.textLabel.frame=CGRectMake((selfSize.width-imageSize.width-textWidth-self.padding)/2+imageSize.width+self.padding, paddingY + paddingVertical, textWidth, textSize.height);
                    }
                    break;
                case NSTextAlignmentRight:
                    if (textSize.height>imageSize.height) {
                        self.imageView.frame=CGRectMake((selfSize.width-imageSize.width-textWidth-self.padding), paddingY + paddingVertical, imageSize.width, imageSize.height);
                        self.textLabel.frame=CGRectMake((selfSize.width-imageSize.width-textWidth-self.padding)+imageSize.width+self.padding, paddingVertical, textWidth, textSize.height);
                    }else{
                        self.imageView.frame=CGRectMake((selfSize.width-imageSize.width-textWidth-self.padding), paddingVertical, imageSize.width, imageSize.height);
                        self.textLabel.frame=CGRectMake((selfSize.width-imageSize.width-textWidth-self.padding)+imageSize.width+self.padding, paddingY + paddingVertical, textWidth, textSize.height);
                    }
                    break;
                default:
                    if (textSize.height>imageSize.height) {
                        self.imageView.frame=CGRectMake(0, paddingY+paddingVertical, imageSize.width, imageSize.height);
                        self.textLabel.frame=CGRectMake(imageSize.width+self.padding, paddingVertical, textWidth, textSize.height);
                    }else{
                        self.imageView.frame=CGRectMake(0, paddingVertical, imageSize.width, imageSize.height);
                        self.textLabel.frame=CGRectMake(imageSize.width+self.padding, paddingY + paddingVertical, textWidth, textSize.height);
                    }
                    break;
            }
            
            if (self.textLabel.lineBreakMode==NSLineBreakByWordWrapping) {
                
                CGFloat textSizeHeight=[_textLabel.text sizeWithFont:self.textLabel.font constrainedToSize:CGSizeMake(self.bounds.size.width, 999) lineBreakMode:self.textLabel.lineBreakMode].height;
                CGRect textLabelRect=self.textLabel.frame;
                textLabelRect.size.height=textSizeHeight;
                self.textLabel.frame=textLabelRect;
            }
            break;
        }
        case SJImageLabelImagePositionRight:
        {
            CGFloat textWidth=MIN((self.bounds.size.width-imageSize.width-self.padding),textSize.width);
            switch (self.textLabel.textAlignment) {
                case NSTextAlignmentCenter:
                    if (textSize.height>imageSize.height) {
                        self.imageView.frame=CGRectMake((selfSize.width-imageSize.width-textWidth-self.padding)/2+textWidth+self.padding, paddingY + paddingVertical, imageSize.width, imageSize.height);
                        self.textLabel.frame=CGRectMake((selfSize.width-imageSize.width-textWidth-self.padding)/2, paddingVertical, textWidth, textSize.height);
                    }else{
                        self.imageView.frame=CGRectMake((selfSize.width-imageSize.width-textWidth-self.padding)/2+textWidth+self.padding, paddingVertical, imageSize.width, imageSize.height);
                        self.textLabel.frame=CGRectMake((selfSize.width-imageSize.width-textWidth-self.padding)/2, paddingY + paddingVertical, textWidth, textSize.height);
                    }
                    break;
                case NSTextAlignmentRight:
                    if (textSize.height>imageSize.height) {
                        self.imageView.frame=CGRectMake((selfSize.width-imageSize.width-textWidth-self.padding)+textWidth+self.padding, paddingY + paddingVertical, imageSize.width, imageSize.height);
                        self.textLabel.frame=CGRectMake((selfSize.width-imageSize.width-textWidth-self.padding), paddingVertical, textWidth, textSize.height);
                    }else{
                        self.imageView.frame=CGRectMake((selfSize.width-imageSize.width-textWidth-self.padding)+textWidth+self.padding, paddingVertical, imageSize.width, imageSize.height);
                        self.textLabel.frame=CGRectMake((selfSize.width-imageSize.width-textWidth-self.padding), paddingY + paddingVertical, textWidth, textSize.height);
                    }
                    break;
                default:
                    if (textSize.height>imageSize.height) {
                        self.imageView.frame=CGRectMake(textWidth+self.padding, paddingY + paddingVertical, imageSize.width, imageSize.height);
                        self.textLabel.frame=CGRectMake(0, paddingVertical, textWidth, textSize.height);
                    }else{
                        self.imageView.frame=CGRectMake(textWidth+self.padding, paddingVertical, imageSize.width, imageSize.height);
                        self.textLabel.frame=CGRectMake(0, paddingY + paddingVertical, textWidth, textSize.height);
                    }
                    break;
            }
            if (self.textLabel.lineBreakMode==NSLineBreakByWordWrapping) {
                
                CGFloat textSizeHeight=[_textLabel.text sizeWithFont:self.textLabel.font constrainedToSize:CGSizeMake(self.bounds.size.width, 999) lineBreakMode:self.textLabel.lineBreakMode].height;
                CGRect textLabelRect=self.textLabel.frame;
                textLabelRect.size.height=textSizeHeight;
                self.textLabel.frame=textLabelRect;
            }
        }
            break;
        case SJImageLabelImagePositionTop:
        {
            self.imageView.frame=CGRectMake((selfSize.width-imageSize.width)/2, 0, imageSize.width, imageSize.height);
            self.textLabel.frame=CGRectMake(0, imageSize.height+self.padding-ABS(textSize.height-self.textLabel.font.pointSize), selfSize.width, textSize.height);
            
        }
            break;
        case SJImageLabelImagePositionBottom:
        {
            self.textLabel.frame=CGRectMake(0, 0, selfSize.width, textSize.height);
            self.imageView.frame=CGRectMake((selfSize.width-imageSize.width)/2, textSize.height+self.padding, imageSize.width,imageSize.height);
            
        }
            break;
    }
    
}

-(void)quicklySetFontPoint:(CGFloat)fontPoint textColorHex:(NSString*)textColorHex textAlignment:(NSTextAlignment)textAlignment imageName:(NSString *)imageName imagePosition:(SJImageLabelImagePosition)imagePosition padding:(NSInteger)padding{
    self.imagePostion=imagePosition;
    self.imageView.image=[UIImage imageNamed:imageName];
    self.padding=padding;
    [self.textLabel quicklySetFontPoint:fontPoint textColorHex:textColorHex textAlignment:textAlignment];
}

-(void)quicklySetFontPoint:(CGFloat)fontPoint textColorHex:(NSString *)textColorHex textAlignment:(NSTextAlignment)textAlignment imageURL:(NSString *)imageURL imageSize:(CGSize)imageSize imagePosition:(SJImageLabelImagePosition)imagePosition padding:(NSInteger)padding{
    self.imageView.frame=CGRectMake(0, 0, imageSize.width, imageSize.height);
    self.isAutoImageSize=NO;
    self.imagePostion=imagePosition;
//    if (imageURL) {
//        self.imageView.imageURL=[NSURL URLWithString:imageURL];
//    }
    self.padding=padding;
    [self.textLabel quicklySetFontPoint:fontPoint textColorHex:textColorHex textAlignment:textAlignment];

}

-(void)dealloc{
    @try {
        [self.textLabel removeObserver:self forKeyPath:@"text" context:nil];
        [self.textLabel removeObserver:self forKeyPath:@"attributedText" context:nil];
        [self.textLabel removeObserver:self forKeyPath:@"font" context:nil];
        [self.imageView removeObserver:self forKeyPath:@"image" context:nil];
        [self removeObserver:self forKeyPath:@"frame" context:nil];
    }
    @catch (NSException *exception) { }  @finally {}
}

@end