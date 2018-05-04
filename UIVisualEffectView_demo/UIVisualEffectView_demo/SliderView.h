//
//  SliderView.h
//  UIVisualEffectView_demo
//
//  Created by zhang yu on 2018/5/2.
//  Copyright © 2018年 zhang yu. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SliderDelegate<NSObject>

- (void)sliderToIndex:(float)value;

@end
@interface SliderView : UIView


@property (nonatomic,strong) UISlider *slider;
@property (nonatomic,assign) id<SliderDelegate> delegate;

@end
