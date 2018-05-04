//
//  SliderViewController.m
//  UIVisualEffectView_demo
//
//  Created by zhang yu on 2018/4/28.
//  Copyright © 2018年 zhang yu. All rights reserved.
//

#import "SliderViewController.h"
#import "SliderView.h"
@interface SliderViewController ()

@property (nonatomic,strong) SliderView *sliderView;
@end

@implementation SliderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _sliderView = [[SliderView alloc]initWithFrame:CGRectMake(10, [UIScreen mainScreen].bounds.size.height - 100, [UIScreen mainScreen].bounds.size.width - 20, 100)];
    _sliderView.backgroundColor = [UIColor colorWithHexString:@"#E6E6E6"];
    [self.view addSubview:_sliderView];
    
}




@end
