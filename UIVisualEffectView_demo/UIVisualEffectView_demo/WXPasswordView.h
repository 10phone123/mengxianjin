//
//  WXPasswordView.h
//  UIVisualEffectView_demo
//
//  Created by zhang yu on 2018/4/26.
//  Copyright © 2018年 zhang yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NOCopyTextField.h"
@interface WXPasswordView : UIView
@property (nonatomic,strong) NOCopyTextField *textfield;
@property (nonatomic,strong) NSMutableArray *btnsArr;
- (instancetype)initWithFrame:(CGRect)frame withCountNum:(int)count;


@end
