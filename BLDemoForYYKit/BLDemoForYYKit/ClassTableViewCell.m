//
//  ClassTableViewCell.m
//  268EDU_Demo
//
//  Created by EDU268 on 15/11/2.
//  Copyright © 2017年 edu268. All rights reserved.
//

#import "ClassTableViewCell.h"
#import "BLCourseDataModel.h"
#import "BLCourseCellFrame.h"


@interface ClassTableViewCell ()

@property (nonatomic, strong) YYAnimatedImageView *myImageView;

@property (weak, nonatomic) YYLabel *myTitle;

@property (weak, nonatomic) YYLabel *myPlayCount;

@property (weak, nonatomic) YYLabel *myPrice;
@property (nonatomic, weak) UIView *lineView;


@end
@implementation ClassTableViewCell


+ (instancetype)cellWithTableView:(UITableView *)tableview
{
    static NSString *homeCell = @"homeCell";
    ClassTableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:homeCell];
   
    if (cell == nil){
        cell = [[ClassTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:homeCell];
    }
    return cell;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        
        [self setCellControlView];
        
    }
    return self;
}

- (void) setCellControlView
{
    
    _myImageView = [YYAnimatedImageView new];
    _myImageView.clipsToBounds = YES;
    _myImageView.contentMode = UIViewContentModeScaleAspectFill;
    _myImageView.backgroundColor = [UIColor whiteColor];

    [self.contentView addSubview:_myImageView];
    
    YYLabel *myTitle = [self labelWithFontSize:15.f color:[UIColor blackColor]];
    self.myTitle = myTitle;
    
    
    YYLabel *myPlayCount = [self labelWithFontSize:13.f color:[UIColor grayColor]];
    self.myPlayCount = myPlayCount;
    
    YYLabel *myPrice = [self labelWithFontSize:13.f color:[UIColor grayColor]];
    self.myPrice = myPrice;
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:line];
    self.lineView = line;
    
    
}

- (YYLabel *)labelWithFontSize:(CGFloat)fontsize color:(UIColor *)color
{
    YYLabel *label = [YYLabel new];
    label.font = [UIFont systemFontOfSize:fontsize];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor colorWithRed:0.033 green:0.685 blue:0.978 alpha:0.730];
    
    [self.contentView addSubview:label];

    return label;
}


- (void) setFrameModel:(BLCourseCellFrame *)frameModel
{
    _frameModel = frameModel;
   
    BLCourseDataModel *model = frameModel.model;
    
    self.myImageView.frame = frameModel.imageFrame;
    NSString *imageUrl = [NSString stringWithFormat:@"%@%@", imageUrlString, model.mobileLogo];
    NSURL *url = [NSURL URLWithString:imageUrl];
    [self.myImageView setImageURL:url];

    self.myTitle.text = model.name;
    self.myTitle.frame = frameModel.titleFrame;
    
    self.myPlayCount.text = model.pageViewcount;
    self.myPlayCount.frame = frameModel.playCountFrame;
    
    self.myPrice.text = model.currentprice;
    self.myPrice.frame = frameModel.priceFrame;
    
    self.lineView.frame = frameModel.lineFrame;
}

- (void)setImageURL:(NSURL *)url {
    
    [CATransaction begin];
    [CATransaction setDisableActions: YES];
    [CATransaction commit];
    [_myImageView setImageWithURL:url
              placeholder:nil
                  options:YYWebImageOptionSetImageWithFadeAnimation
               completion:nil];
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
