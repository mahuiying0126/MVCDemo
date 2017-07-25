//
//  BLCourseTableView.h
//  BLCoreTextTableView
//
//  Created by yzla50010 on 2017/3/1.
//  Copyright © 2017年 yizhilu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BLCourseDataModel;



@protocol BLCourseTableViewDelegate <NSObject>

@optional
- (void)courseCellDidSelected:(BLCourseDataModel *)model index:(NSUInteger)idx;

@end
@interface BLCourseTableView : UITableView
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, weak) id <BLCourseTableViewDelegate> courseDelegate;

@end
