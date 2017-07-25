//
//  BLCourseDataModel.h
//  268EDU_Demo
//
//  Created by yzla50010 on 2017/3/7.
//  Copyright © 2017年 edu268. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BLCourseDataModel : NSObject

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSUInteger isPay;

@property (nonatomic, copy) NSString *sourceprice;
@property (nonatomic, copy) NSString *currentprice;

@property (nonatomic, assign) NSUInteger lessionnum;

@property (nonatomic, copy) NSString *mobileLogo;
@property (nonatomic, assign) NSUInteger losetype;
@property (nonatomic, copy) NSString *pageViewcount;

@property (nonatomic, strong) NSArray *teacherList;


@end
