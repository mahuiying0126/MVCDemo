//
//  ClassTableViewCell.h
//  268EDU_Demo
//
//  Created by EDU268 on 15/11/2.
//  Copyright © 2017年 edu268. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BLCourseCellFrame;

@interface ClassTableViewCell : UITableViewCell


+ (instancetype)cellWithTableView:(UITableView *)tableview;


@property (nonatomic, strong) BLCourseCellFrame *frameModel;


@end
