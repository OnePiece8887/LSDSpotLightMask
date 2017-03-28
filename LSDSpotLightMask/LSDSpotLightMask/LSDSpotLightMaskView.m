//
//  LSDSpotLightMaskView.m
//  LSDSpotLightMask
//
//  Created by 神州锐达 on 17/3/27.
//  Copyright © 2017年 OnePiece. All rights reserved.
//

#import "LSDSpotLightMaskView.h"

#define KSCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define KSCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface LSDSpotLightMaskView ()

///背景视图
@property(strong,nonatomic)UIView *bgView;
///新手引导图片
@property(strong,nonatomic)UIImageView *guideImageView;


@end

@implementation LSDSpotLightMaskView

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{

    if (self = [super initWithCoder:aDecoder]) {
        [self setupUI];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{

    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
    }
    return self;
}

-(void)setupUI
{

    [[UIApplication sharedApplication].keyWindow addSubview:self.bgView];
  
    [self.bgView addSubview:self.guideImageView];
    
    
}


-(void)layoutSubviews
{

    [super layoutSubviews];
    
    self.bgView.frame = self.frame;
    
    
}

-(void)configureMaskViewSpotLightPoint:(CGPoint)spotLightPoint radius:(CGFloat)radius guideImageFrame:(CGRect)guideImageFrame guideImage:(NSString *)guideImage
{

    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];

    [bezierPath appendPath:[UIBezierPath bezierPathWithArcCenter:spotLightPoint radius:radius startAngle:0 endAngle:2*M_PI clockwise:NO]];
    
    CAShapeLayer *sharpLayer = [CAShapeLayer layer];
    
    sharpLayer.path = bezierPath.CGPath;
    sharpLayer.fillRule = kCAFillRuleEvenOdd;
    
    [self.bgView.layer setMask:sharpLayer];
    
    self.guideImageView.frame = guideImageFrame;
    self.guideImageView.image = [UIImage imageNamed:guideImage];
}

-(void)nextSpotLight
{

    if ([self.delegate respondsToSelector:@selector(SpotLightMaskViewDidbgViewTapWithIndex:)]) {
        [self.delegate SpotLightMaskViewDidbgViewTapWithIndex:self.index];
    }
    
    [self.bgView removeFromSuperview];
    [self.guideImageView removeFromSuperview];
    [self removeFromSuperview];
    
}

#pragma mark -- 懒加载
-(UIView *)bgView
{
    if (_bgView == nil) {
        _bgView = [[UIView alloc]initWithFrame:CGRectZero];
        _bgView.backgroundColor = [UIColor blackColor];
        _bgView.alpha = 0.8;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(nextSpotLight)];
        [_bgView addGestureRecognizer:tap];
   
    }
    return _bgView;
}

-(UIImageView *)guideImageView
{

    if (_guideImageView == nil) {
        _guideImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    }
    return _guideImageView;
}


@end
