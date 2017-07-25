//
//  BLCourseCellFrame.h
//  BLCoreTextTableView
//
//  Created by yzla50010 on 2017/3/2.
//  Copyright © 2017年 yizhilu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class BLCourseDataModel;

@interface BLCourseCellFrame : NSObject


@property (nonatomic, strong) BLCourseDataModel *model;


@property (nonatomic, assign) CGRect imageFrame;
@property (nonatomic, assign) CGRect titleFrame;
@property (nonatomic, assign) CGRect playCountFrame;
@property (nonatomic, assign) CGRect priceFrame;
@property (nonatomic, assign) CGRect lineFrame;



@property (nonatomic, assign) CGFloat cellHeight;



@end
