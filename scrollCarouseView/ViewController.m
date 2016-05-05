//
//  ViewController.m
//  轮播图
//
//  Created by 方健 on 16/4/12.
//  Copyright © 2016年 方健. All rights reserved.
//

#import "ViewController.h"
#import "XRCarouselView.h"

@interface ViewController ()<XRCarouselViewDelegate>
@property (nonatomic, weak) XRCarouselView *lunBoView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSMutableArray *imgArr = [NSMutableArray array];
    for (int i = 1;i<4;i++ ) {
        NSString *imageName = [NSString stringWithFormat:@"%d.jpg",i];
        UIImage *image = [UIImage imageNamed:imageName];
        [imgArr addObject:image];
    }
    
    NSArray *desArr = @[@"1.jpg",@"2.jpg",@"3.jpg"];
    
    //此初始化的方法便不用设置代理
//    XRCarouselView *lunboView = [[XRCarouselView alloc] initWithImageArray:imgArr imageClickBlock:^(NSInteger index) {
//        [self imageClick:index];
//    }];
    
    XRCarouselView *lunboView = [[XRCarouselView alloc] initWithImageArray:imgArr describeArray:desArr];
    _lunBoView = lunboView;
    lunboView.describeArray = desArr;
    
    lunboView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 200);
    //设置pageControl的中心点位置
    lunboView.pageControl.center = CGPointMake(lunboView.frame.size.width * 0.99, lunboView.frame.size.height - 20);
    lunboView.time = 10;
    
    lunboView.delegate = self;
    
    [self.view addSubview:lunboView];
    
}

- (void)imageClick:(NSInteger)index {
    
    NSLog(@"点击了第%ld张图片",index);
}

#pragma mark - lunboViewDelegate

- (void)carouselView:(XRCarouselView *)carouselView didClickImage:(NSInteger)index {

    NSLog(@"%@,%ld",carouselView,index);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
