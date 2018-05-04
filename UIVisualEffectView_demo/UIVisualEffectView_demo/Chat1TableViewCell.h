//
//  Chat1TableViewCell.h
//  UIVisualEffectView_demo
//
//  Created by zhang yu on 2018/5/2.
//  Copyright © 2018年 zhang yu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Chat1TableViewCell : UITableViewCell
@property (nonatomic,strong) UIImageView *userImage;
@property (nonatomic,strong) UILabel *desLabel;


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier WithType:(int)type;//1-自己，2-其他人

@end
