//
//  NOCopyTextField.m
//  UIVisualEffectView_demo
//
//  Created by zhang yu on 2018/4/26.
//  Copyright © 2018年 zhang yu. All rights reserved.
//

#import "NOCopyTextField.h"

@implementation NOCopyTextField

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    [super canPerformAction:action withSender:sender];
    if (action == @selector(paste:))//禁止粘贴
        return NO;
    if (action == @selector(select:))// 禁止选择
        return NO;
    if (action == @selector(selectAll:))// 禁止全选
        return NO;
    return NO;
}
@end
