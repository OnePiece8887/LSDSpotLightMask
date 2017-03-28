//
//  LSDSpotLightMaskView.h
//  LSDSpotLightMask
//
//  Created by 神州锐达 on 17/3/27.
//  Copyright © 2017年 OnePiece. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LSDSpotLightMaskViewDelegate <NSObject>

@optional
-(void)SpotLightMaskViewDidbgViewTapWithIndex:(NSInteger)index;

@end


@interface LSDSpotLightMaskView : UIView

///设置亮点位置中心点和指导图片的frame
-(void)configureMaskViewSpotLightPoint:(CGPoint)spotLightPoint radius:(CGFloat)radius guideImageFrame:(CGRect)guideImageFrame guideImage:(NSString *)guideImage;

///添加的第几个spotLightMaskView
@property(assign,nonatomic)NSInteger index;

///代理
@property(weak,nonatomic)id<LSDSpotLightMaskViewDelegate> delegate;

@end
