//
//  SliderView.m
//  UIVisualEffectView_demo
//
//  Created by zhang yu on 2018/5/2.
//  Copyright © 2018年 zhang yu. All rights reserved.
//

#import "SliderView.h"
@interface SliderView()
{
    float width;
    float beginValue;
}
@end
@implementation SliderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    width = frame.size.width;
    if (self) {
        [self createUI];
    }
    return self;
}
- (void)createUI{
    float btnW = 20;
    float btnH = 20;
    float space = (width - btnW * 6)/5.0;
    NSLog(@"%f",space);
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed:@"line_bar"];
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo([NSNumber numberWithFloat:btnW *0.5]);
        make.width.equalTo([NSNumber numberWithFloat:self->width - btnW]);
        make.height.equalTo(@2.5);
        make.centerY.equalTo(self);
    }];
    for (int i = 0; i<6; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"line_bar1"] forState:UIControlStateNormal];
        btn.tag = 10 + i;
        [self addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo([NSNumber numberWithFloat:i*(btnW+space)]);
            make.height.equalTo([NSNumber numberWithFloat:btnH]);
            make.width.equalTo([NSNumber numberWithFloat:btnW]);
            make.centerY.equalTo(imageView);
        }];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 0) {
            UILabel *label = [[UILabel alloc]init];
            label.textColor = [UIColor blackColor];
            label.font = [UIFont systemFontOfSize:11];
            label.text = @"A";
            label.textAlignment = NSTextAlignmentCenter;
            [self addSubview:label];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@0);
                make.width.equalTo([NSNumber numberWithFloat:btnW]);
                make.height.equalTo(@20);
                make.bottom.equalTo(btn.mas_top).with.offset(-10);
            }];
        }
        if (i == 1) {
            UILabel *label = [[UILabel alloc]init];
            label.textColor = [UIColor blackColor];
            label.font = [UIFont systemFontOfSize:13];
            label.text = @"标准";
            label.textAlignment = NSTextAlignmentCenter;
            [self addSubview:label];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(btn).with.offset(-20);
                make.width.equalTo([NSNumber numberWithFloat:btnW+40]);
                make.height.equalTo(@20);
                make.bottom.equalTo(btn.mas_top).with.offset(-10);
            }];
        }
        if (i == 5) {
            UILabel *label = [[UILabel alloc]init];
            label.textColor = [UIColor blackColor];
            label.font = [UIFont systemFontOfSize:19];
            label.text = @"A";
            label.textAlignment = NSTextAlignmentCenter;
            [self addSubview:label];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(btn);
                make.width.equalTo([NSNumber numberWithFloat:btnW]);
                make.height.equalTo(@20);
                make.bottom.equalTo(btn.mas_top).with.offset(-10);
            }];
        }
        
    }
    _slider = [[UISlider alloc]init];
    _slider.minimumTrackTintColor = [UIColor clearColor];
    _slider.maximumTrackTintColor = [UIColor clearColor];
    _slider.value = 0.2;
    [_slider setThumbImage:[UIImage imageNamed:@"slider_icon"] forState:UIControlStateNormal];
    [self.slider addTarget:self action:@selector(progressChanged:)forControlEvents:UIControlEventValueChanged];
    [self.slider addTarget:self action:@selector(beginChanged:) forControlEvents:UIControlEventTouchDown];
    [self.slider addTarget:self action:@selector(endChange:) forControlEvents:UIControlEventTouchDragOutside];
    _slider.continuous = NO;
    [self addSubview:_slider];
    [_slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.width.equalTo([NSNumber numberWithFloat:self->width]);
        make.height.equalTo(@5);
        make.centerY.equalTo(imageView);
    }];
}
- (void)beginChanged:(id)sender{
    UISlider *slider = (UISlider *)sender;
    NSLog(@"beginChanged:%f",slider.value);
    beginValue = slider.value;
}
- (void)endChange:(id)sender{
    UISlider *slider = (UISlider *)sender;
    NSLog(@"endChange:%f",slider.value);
}
- (void)progressChanged:(id)sender{
    UISlider *slider = (UISlider *)sender;
    NSLog(@"%f",slider.value);
    float value = slider.value;
    float value1;
    if (slider.value <0.2) {
        if (value<beginValue) {
            value1 = 0;
        }else
            value1 = 0.2;
    }
    else if (slider.value <0.4) {
        if (value<beginValue) {
            value1 = 0.2;
        }else
            value1 = 0.4;
    }
    else if (slider.value <0.6) {
        if (value<beginValue) {
            value1 = 0.4;
        }else
            value1 = 0.6;
    }
    else if (slider.value <0.8) {
        if (value<beginValue) {
            value1 = 0.6;
        }else
            value1 = 0.8;
    }
    else {
        if (value<beginValue) {
            value1 = 0.8;
        }else
            value1 = 1.0;
    }
    _slider.value = value1;
    [self complete:value1];
    
}
- (void)btnClick:(id)sender{
    UIButton *btn = (UIButton *)sender;
    float value;
    switch (btn.tag) {
        case 10://0
            value = 0;
            break;
        case 11://20
            value = 0.2;
            break;
        case 12://40
            value = 0.4;
            break;
        case 13://60
            value = 0.6;
            break;
        case 14://80
            value = 0.8;
            break;
        case 15://100
            value = 1;
            break;
        default:
            value = 0;
            break;
    }
    _slider.value = value;
    [self complete:value];

}
- (void)complete:(float)value{
    
    if ([self.delegate respondsToSelector:@selector(sliderToIndex:)]) {
        [self.delegate sliderToIndex:(float)value];
    }
}
@end
