//
//  ViewController.m
//  UIVisualEffectView_demo
//
//  Created by zhang yu on 2018/4/25.
//  Copyright © 2018年 zhang yu. All rights reserved.
//

#import "ViewController.h"
#import "WXPasswordView.h"
#import "SliderView.h"
#import <SDWebImage/UIImageView+WebCache.h>
#define screen_size [UIScreen mainScreen].bounds.size

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,SliderDelegate>
{
    float fontValue;
}
@property (nonatomic,strong) WXPasswordView *passView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) SliderView *sliderView;
@property (nonatomic,strong) NSMutableArray *dataArr;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置字体大小";
    fontValue = 13;
    _dataArr = [[NSMutableArray alloc]init];
    NSArray *arr = @[@"浏览字体大小",
                     @"拖动下面的滑块，可设置字体大小。",
                     @"设置后，会改变聊天、菜单和朋友圈的字体大小。如果在使用过程中存在问题或意见，可反馈给随行团队。"];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.bounces = NO;
    [_dataArr addObjectsFromArray:arr];
    [_tableView reloadData];
    [self addBottomView];
}
- (void)addBottomView{
    
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, screen_size.height - 100, screen_size.width, 100)];
    bottomView.backgroundColor = [UIColor colorWithHexString:@"#E6E6E6"];
    [self.view addSubview:bottomView];
    _sliderView = [[SliderView alloc]initWithFrame:CGRectMake(10,0,bottomView.width - 20, bottomView.height)];
    _sliderView.delegate = self;
    [bottomView addSubview:_sliderView];
    
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        static NSString *cellId = @"cell1";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
            cell.contentView.backgroundColor = [UIColor colorWithHexString:@"#F2F2F2"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.userInteractionEnabled = NO;
            UIImageView *userImage = [[UIImageView alloc]init];
            [userImage sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@"user_default"]];
            [cell.contentView addSubview:userImage];
            [userImage mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(@30);
                make.height.equalTo(@30);
                make.right.equalTo([NSNumber numberWithFloat:-10]);
                make.top.equalTo(@10);
            }];
            UIImageView *textBack = [[UIImageView alloc]init];
            textBack.image = [UIImage imageNamed:@"back2"];
            [cell.contentView addSubview:textBack];
            [textBack mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(userImage.mas_left).with.offset(-10);
                make.width.equalTo([NSNumber numberWithFloat:screen_size.width  - 80]);
                make.height.equalTo(@50);
                make.top.equalTo(userImage.mas_centerY);
            }];
            textBack.tag = 111;
            UILabel *desLabel = [[UILabel alloc]init];
            desLabel.numberOfLines = 0;
            desLabel.textAlignment = NSTextAlignmentRight;
            desLabel.font = [UIFont systemFontOfSize:fontValue];
            desLabel.textColor = [UIColor blackColor];
            [cell.contentView addSubview:desLabel];
            [desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(textBack.mas_right).with.offset(-20);
                make.width.equalTo([NSNumber numberWithFloat:screen_size.width  - 80]);
                make.height.equalTo(@50);
                make.centerY.equalTo(textBack);
            }];
            desLabel.tag = 110;
        }
        CGFloat maxWith=screen_size.width-30-30-60;
        UILabel *desLabel = (UILabel *)[cell.contentView viewWithTag:110];
        NSString *text = [_dataArr objectAtIndex:indexPath.row];
        CGRect rect = [text boundingRectWithSize:CGSizeMake(maxWith, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontValue]} context:nil];
        [desLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo([NSNumber numberWithFloat:rect.size.width + 10]);
            make.height.equalTo([NSNumber numberWithFloat:rect.size.height+10]);
        }];
        UIImageView *textback = (UIImageView *)[cell.contentView viewWithTag:111];
        [textback mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo([NSNumber numberWithFloat:rect.size.width + 40]);
            make.height.equalTo([NSNumber numberWithFloat:rect.size.height+30]);
        }];
        desLabel.text = text;
        desLabel.font = [UIFont systemFontOfSize:fontValue];
        return cell;
    }else{
        static NSString *cellId = @"cell2";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
            cell.contentView.backgroundColor = [UIColor colorWithHexString:@"#F2F2F2"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.userInteractionEnabled = NO;
            UIImageView *userImage = [[UIImageView alloc]init];
            [userImage sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@"user_default"]];
            [cell.contentView addSubview:userImage];
            [userImage mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(@30);
                make.height.equalTo(@30);
                make.left.equalTo([NSNumber numberWithFloat:10]);
                make.top.equalTo(@10);
            }];
            UIImageView *textBack = [[UIImageView alloc]init];
            textBack.image = [UIImage imageNamed:@"back1"];
            [cell.contentView addSubview:textBack];
            textBack.tag = 11;
            [textBack mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(userImage.mas_right).with.offset(10);
                make.width.equalTo([NSNumber numberWithFloat:screen_size.width - 80]);
                make.height.equalTo(@50);
//                make.top.equalTo(userImage);
                make.top.equalTo(userImage.mas_centerY);
            }];
            UILabel *desLabel = [[UILabel alloc]init];
            desLabel.numberOfLines = 0;
            desLabel.textAlignment = NSTextAlignmentLeft;
            desLabel.font = [UIFont systemFontOfSize:fontValue];
            desLabel.textColor = [UIColor blackColor];
            [cell.contentView addSubview:desLabel];
            [desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(textBack.mas_left).with.offset(20);
                make.width.equalTo([NSNumber numberWithFloat:screen_size.width - 80]);
                make.height.equalTo(@50);
//                make.top.equalTo(userImage);
                make.centerY.equalTo(textBack);
            }];
            desLabel.tag = 10;
        }
        UILabel *desLabel = (UILabel *)[cell.contentView viewWithTag:10];
        desLabel.text = [_dataArr objectAtIndex:indexPath.row];
        desLabel.font = [UIFont systemFontOfSize:fontValue];
        CGFloat maxWith=screen_size.width-30-30-60;
        NSString *text = [_dataArr objectAtIndex:indexPath.row];
        CGRect rect = [text boundingRectWithSize:CGSizeMake(maxWith, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontValue]} context:nil];
        [desLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo([NSNumber numberWithFloat:rect.size.width+10]);
            make.height.equalTo([NSNumber numberWithFloat:rect.size.height+10]);
        }];
        UIImageView *textback = (UIImageView *)[cell.contentView viewWithTag:11];
        [textback mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo([NSNumber numberWithFloat:rect.size.width + 40]);
            make.height.equalTo([NSNumber numberWithFloat:rect.size.height+30]);
        }];
        return cell;
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 150;
}
- (void)sliderToIndex:(float)value1{
    NSString *valueStr = [NSString stringWithFormat:@"%.1f",value1];
    
    if ([valueStr  isEqualToString:@"0.0"]) {
        fontValue = 12;
    }
     if ([valueStr  isEqualToString:@"0.2"]){
        fontValue = 13;
    }
     if ([valueStr  isEqualToString:@"0.4"]){
        fontValue = 14;
    }
     if ([valueStr  isEqualToString:@"0.6"]){
        fontValue = 15;
    }
    if ([valueStr  isEqualToString:@"0.8"]){
        fontValue = 16;
    }
    if ([valueStr  isEqualToString:@"1.0"]){
        fontValue = 17;
    }
    [_tableView reloadData];
}
@end
