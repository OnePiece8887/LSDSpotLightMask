//
//  ViewController.m
//  LSDSpotLightMask
//
//  Created by 神州锐达 on 17/3/27.
//  Copyright © 2017年 OnePiece. All rights reserved.
//

#import "ViewController.h"
#import "LSDSpotLightMaskView.h"
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
@interface ViewController ()<LSDSpotLightMaskViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    

    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    [btn addTarget:self action:@selector(show) forControlEvents:UIControlEventTouchUpInside];
    
    btn.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:btn];
    

}

-(void)show{

    LSDSpotLightMaskView *spotView1 = [[LSDSpotLightMaskView alloc]initWithFrame:self.view.bounds];
    spotView1.index = 1;
    [spotView1 configureMaskViewSpotLightPoint:CGPointMake(100, 100) radius:40 guideImageFrame:CGRectMake(0, 150, SCREEN_WIDTH, 200) guideImage:@"Snip20170315_1"];
    spotView1.delegate = self;
    [self.view addSubview:spotView1];
}

-(void)SpotLightMaskViewDidbgViewTapWithIndex:(NSInteger)index
{

    switch (index) {
        case 1:
        {
            LSDSpotLightMaskView *spotView2 = [[LSDSpotLightMaskView alloc]initWithFrame:self.view.bounds];
            spotView2.index = 2;
            [spotView2 configureMaskViewSpotLightPoint:CGPointMake(100, 300) radius:40 guideImageFrame:CGRectMake(0, 300, SCREEN_WIDTH, 200) guideImage:@"Snip20170315_1"];
            [self.view addSubview:spotView2];
        
        }
            break;
        case 2:
        {
            LSDSpotLightMaskView *spotView3 = [[LSDSpotLightMaskView alloc]initWithFrame:self.view.bounds];
            spotView3.index = 3;
            [spotView3 configureMaskViewSpotLightPoint:CGPointMake(100, 0) radius:40 guideImageFrame:CGRectMake(0, 400, SCREEN_WIDTH, 200) guideImage:@"Snip20170315_1"];
            [self.view addSubview:spotView3];
            
        }
            break;
     
        default:
            break;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
