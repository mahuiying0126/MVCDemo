//
//  BLCourseTableView.m
//  BLCoreTextTableView
//
//  Created by yzla50010 on 2017/3/1.
//  Copyright © 2017年 yizhilu. All rights reserved.
//

#import "BLCourseTableView.h"
#import "ClassTableViewCell.h"
#import "BLCourseDataModel.h"
#import "BLCourseCellFrame.h"
@interface BLCourseTableView ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation BLCourseTableView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.delegate = self;
        self.dataSource = self;
    
    }
    return self;
}

- (void)setDataArray:(NSArray *)dataArray
{
    NSMutableArray *tmp = @[].mutableCopy;
   
    for (NSUInteger i = 0; i < 50; i ++)
    {
        [tmp addObjectsFromArray:dataArray];
    }
    _dataArray = tmp;

    [self reloadData];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView

{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BLCourseCellFrame *cellFrame = self.dataArray[indexPath.row];
    
    ClassTableViewCell *cell = [ClassTableViewCell cellWithTableView:tableView];

    cell.frameModel = cellFrame;
    
    return cell;

}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BLCourseCellFrame *cellFrame = self.dataArray[indexPath.row];

    return cellFrame.cellHeight;
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    BLCourseCellFrame *cellFrame = self.dataArray[indexPath.row];
    BLCourseDataModel *model = cellFrame.model;
    
    if (self.courseDelegate && [self.courseDelegate respondsToSelector:@selector(courseCellDidSelected:index:)])
    {
        [self.courseDelegate courseCellDidSelected:model index:indexPath.row];
    }

}



@end
