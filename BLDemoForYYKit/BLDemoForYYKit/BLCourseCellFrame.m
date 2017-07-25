//
//  BLCourseCellFrame.m
//  BLCoreTextTableView
//
//  Created by yzla50010 on 2017/3/2.
//  Copyright © 2017年 yizhilu. All rights reserved.
//

#import "BLCourseCellFrame.h"
#import "BLCourseDataModel.h"

#define BLBorderH 10
#define BLTopH 15

@implementation BLCourseCellFrame

- (void)setModel:(BLCourseDataModel *)model
{
    _model = model;
    
    CGRect imageFrame = CGRectMake(BLTopH, BLTopH, 130, 64);
    self.imageFrame = imageFrame;

    CGFloat title_x = CGRectGetMaxX(imageFrame) + BLBorderH;
    
    CGFloat width = kScreen_width - title_x - BLBorderH;
    
    //因为坐标系是左下角,
    CGSize titleSize = [model.name sizeForFont:FONT(15.f) size:CGSizeMake(width, MAXFLOAT) mode:(NSLineBreakByCharWrapping)];
    
    CGSize playCountSize = [model.pageViewcount sizeForFont:FONT(15.f) size:CGSizeMake(width, MAXFLOAT) mode:(NSLineBreakByCharWrapping)];;
    
    CGSize priceSize = [model.currentprice sizeForFont:FONT(15.f) size:CGSizeMake(width, MAXFLOAT) mode:(NSLineBreakByCharWrapping)];
    
    //title 在第一行
    CGFloat title_y = CGRectGetMinY(imageFrame);
    CGRect titleFrame = CGRectMake(title_x, title_y, titleSize.width, titleSize.height);
    self.titleFrame = titleFrame;

    CGFloat playCount_y = CGRectGetMaxY(imageFrame)-playCountSize.height;

    CGRect playCountFrame = CGRectMake(title_x, playCount_y, playCountSize.width, playCountSize.height);
    self.playCountFrame = playCountFrame;

    
    CGFloat price_y = playCount_y;

    CGFloat price_x = CGRectGetMaxX(playCountFrame) + 2*BLBorderH;
    CGRect priceFrame = CGRectMake(price_x, price_y, priceSize.width, priceSize.height);
    self.priceFrame = priceFrame;
    
    self.lineFrame = CGRectMake(BLTopH, CGRectGetMaxY(imageFrame) + BLTopH, kScreen_width - BLTopH, 1.0f);
    self.cellHeight = CGRectGetMaxY(self.lineFrame);
}







@end
