//
//  WXPasswordView.m
//  UIVisualEffectView_demo
//
//  Created by zhang yu on 2018/4/26.
//  Copyright © 2018年 zhang yu. All rights reserved.
//

#import "WXPasswordView.h"
#define Selfsize self.bounds.size

@interface WXPasswordView()<UITextFieldDelegate>
{
    int _count;
}
@end
@implementation WXPasswordView
- (NSMutableArray *)btnsArr{
    if (!_btnsArr) {
        _btnsArr = [[NSMutableArray alloc]init];
    }
    return _btnsArr;
}
- (instancetype)initWithFrame:(CGRect)frame withCountNum:(int)count{
    self = [super initWithFrame:frame];
    _count = count;
    if (self) {
        [self createUI];
    }
    return self;
}
- (void)createUI{
    
    float btnWidth = (Selfsize.width - 75)/_count;
    float btnHeigth = btnWidth;
    for (int i = 0; i < _count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:[UIImage imageNamed:@"square"] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:30];
        btn.frame = CGRectMake(i*(btnWidth + 25) , (Selfsize.height - btnHeigth)/2.0, btnWidth, btnHeigth);
        [self addSubview:btn];
        [self.btnsArr addObject:btn];
    }
    _textfield = [[NOCopyTextField alloc]initWithFrame:CGRectMake(0, 0, Selfsize.width - 20, 100)];
    _textfield.delegate = self;
    _textfield.backgroundColor = [UIColor clearColor];
    _textfield.textColor = [UIColor clearColor];
    _textfield.keyboardType = UIKeyboardTypeNumberPad;
    
    //输入框光标的颜色为白色
    _textfield.tintColor = [UIColor clearColor];
    [_textfield addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self addSubview:_textfield];
    
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if([string isEqualToString:@"\n"]) {
        //按回车关闭键盘
        [textField resignFirstResponder];
        return NO;
    } else if(string.length == 0) {
        //判断是不是删除键
        return YES;
    }
    else if(textField.text.length >= _count) {
        //输入的字符个数大于4，则无法继续输入，返回NO表示禁止输入
        NSLog(@"输入的字符个数大于4，忽略输入");
        [textField resignFirstResponder];
        return NO;
    } else {
        return YES;
    }
}
/**
 *  重置显示的点
 */
- (void)textFieldDidChange:(UITextField *)textField
{
    NSLog(@"%@", textField.text);
    for (int i = 0; i < _count; i++) {
        UIButton *btn = (UIButton *)[self.btnsArr objectAtIndex:i];
        if (i<textField.text.length) {
            [UIView animateWithDuration:0.2 animations:^{
//            [btn setTitle:[NSString stringWithFormat:@"%c",[textField.text characterAtIndex:i]] forState:UIControlStateNormal];
                [btn setImage:[UIImage imageNamed:@"dot"] forState:UIControlStateNormal];
            } completion:^(BOOL finished) {
//                 [btn setTitle:@"" forState:UIControlStateNormal];
                
            }];
        }else{
//            [btn setTitle:@"" forState:UIControlStateNormal];
               [btn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        }
    }
    if (textField.text.length == _count) {
         [textField resignFirstResponder];
        
    }
}


@end
