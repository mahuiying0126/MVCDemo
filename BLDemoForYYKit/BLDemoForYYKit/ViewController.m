//
//  ViewController.m
//  BLDemoForYYKit
//
//  Created by yzla50010 on 2017/3/13.
//  Copyright © 2017年 yizhilu. All rights reserved.
//

#import "ViewController.h"
#import "BLCourseCellFrame.h"
#import "BLCourseDataModel.h"
#import "BLCourseTableView.h"

@interface ViewController ()


@property (nonatomic, weak) BLCourseTableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    
    [manager POST:courseUrl parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if ([responseObject[@"success"] boolValue]) {
            
            NSDictionary *entity = responseObject[@"entity"];
            NSArray *list = entity[@"courseList"];
            NSMutableArray *tmpArray  = [NSMutableArray array];
            for (NSDictionary *dict in list)
            {
                BLCourseDataModel *model = [BLCourseDataModel modelWithDictionary:dict];

                BLCourseCellFrame *cellFrame = [[BLCourseCellFrame alloc] init];

                cellFrame.model = model;
                
                NSLog(@"%@", model.name);
                [tmpArray addObject:cellFrame];
            }
            
            self.tableView.dataArray = tmpArray;
            
            NSLog(@"%@", responseObject);
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
    }];
    
}
/*
 NSMutableArray *tmp = @[].mutableCopy;
 
 for (NSUInteger i = 0; i < dataArray.count; i ++)
 {
 BLCourseDataModel *model = dataArray[i];
 model.pageViewcount = [NSString stringWithFormat:@"播放量: %@", model.pageViewcount];
 model.currentprice = [NSString stringWithFormat:@"价格: %@", model.currentprice];
 
 BLCourseCellFrame *cellFrame = [[BLCourseCellFrame alloc] init];
 cellFrame.model = model;
 
 [tmp addObject:cellFrame];
 }
 */


- (BLCourseTableView *)tableView
{
    if (!_tableView) {
       BLCourseTableView * tableView = [[BLCourseTableView alloc] init];
        tableView.frame = self.view.bounds;
        [self.view addSubview:tableView];
        
        _tableView = tableView;
    }
    return _tableView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
