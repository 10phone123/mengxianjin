//
//  UIColor+HexColor.m
//  contact_demo
//
//  Created by zhang yu on 2018/4/12.
//  Copyright © 2018年 zhang yu. All rights reserved.
//

#import "UIColor+HexColor.h"

@implementation UIColor (HexColor)

+ (UIColor *)colorWithHexString:(NSString *)hexString{
    NSString *cString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]uppercaseString];
//    if([cString length]6){
//        return [UIColor clearColor];
//    }
    if([cString hasPrefix:@"0X"]){
        cString = [cString substringFromIndex:2];
    }
    if([cString hasPrefix:@"#"]){
        cString = [cString substringFromIndex:1];
    }
    if([cString length] != 6){
         return [UIColor clearColor];
    }
    NSRange range;
    range.location = 0;
    range.length = 2;
//    r
    NSString *rString = [cString substringWithRange:range];
    
//    g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
//    b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
//
    unsigned int r,g,b;
    [[NSScanner scannerWithString:rString]scanHexInt:&r];
    [[NSScanner scannerWithString:gString]scanHexInt:&g];
    [[NSScanner scannerWithString:bString]scanHexInt:&b];
    NSLog(@"%u",r);
    NSLog(@"%u",g);
    NSLog(@"%u",b);
    return [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:1.0f];
    
}
    
@end
