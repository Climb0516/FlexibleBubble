//
//  CLViewController.m
//  FlexibleBubble
//
//  Created by 王攀登 on 05/19/2022.
//  Copyright (c) 2022 王攀登. All rights reserved.
//

#import "CLViewController.h"
#import "Masonry.h"
#import "CLFlexibleBubble.h"


//动态状态栏高度
#define kSTATUSHEIGHT_dynamic [[UIApplication sharedApplication] statusBarFrame].size.height
//导航栏高度
#define kNAVHEIGHT    44
//状态栏+导航栏高度（iPhone X为88，其他为64）
#define kSTATUSNAVHEIGHT ((kSTATUSHEIGHT_dynamic>40?44:20)+kNAVHEIGHT)
#define kTABBARHEIGHT    (kSTATUSHEIGHT_dynamic>40?90:56)//适配iPhone x 底栏高度
// 底部宏
#define kSAFEAREABOTTOMHEIGHT (kSTATUSHEIGHT_dynamic>40?34:0)

@interface CLViewController ()

@property (nonatomic, strong) UIButton *btnTop1;
@property (nonatomic, strong) UIButton *btnTop2;
@property (nonatomic, strong) UIButton *btnTop3;
@property (nonatomic, strong) UIButton *btnTop4;
@property (nonatomic, strong) UIButton *btnTop5;
@property (nonatomic, strong) UIButton *btnLeft1;
@property (nonatomic, strong) UIButton *btnLeft2;
@property (nonatomic, strong) UIButton *btnRight1;
@property (nonatomic, strong) UIButton *btnRight2;
@property (nonatomic, strong) UIButton *btnBtm1;
@property (nonatomic, strong) UIButton *btnBtm2;
@property (nonatomic, strong) UIButton *btnBtm3;
@property (nonatomic, strong) UIButton *btnBtm4;
@property (nonatomic, strong) UIButton *btnBtm5;


@end

@implementation CLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.font = [UIFont boldSystemFontOfSize:18.f];
    [self.view addSubview:titleLabel];
    titleLabel.text = @"灵活配置小气泡Demo";
    titleLabel.textColor = UIColor.blackColor;
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(kSTATUSHEIGHT_dynamic+10);
        make.centerX.equalTo(self.view);
    }];

    self.btnTop1 = [UIButton new];
    [self.btnTop1 setBackgroundColor:UIColor.blackColor];
    self.btnTop1.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:self.btnTop1];
    self.btnTop1.layer.masksToBounds = YES;
    self.btnTop1.layer.cornerRadius = 4;
    [self.btnTop1 setTitle:@"1-Top" forState:UIControlStateNormal];
    [self.btnTop1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(40);
        make.top.offset(kSTATUSNAVHEIGHT+50);
        make.width.mas_equalTo(50.f);
        make.height.mas_equalTo(20.f);
    }];
    [self.btnTop1 addTarget:self action:@selector(btnTop1Action) forControlEvents:UIControlEventTouchUpInside];
    
    self.btnTop2 = [UIButton new];
    [self.btnTop2 setBackgroundColor:UIColor.blackColor];
    self.btnTop2.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:self.btnTop2];
    self.btnTop2.layer.masksToBounds = YES;
    self.btnTop2.layer.cornerRadius = 2;
    [self.btnTop2 setTitle:@"2-Top" forState:UIControlStateNormal];
    [self.btnTop2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(40);
        make.top.equalTo(self.btnTop1.mas_bottom).offset(20);
        make.width.mas_equalTo(50.f);
        make.height.mas_equalTo(20.f);
    }];
    [self.btnTop2 addTarget:self action:@selector(btnTop2Action) forControlEvents:UIControlEventTouchUpInside];
    
    self.btnTop3 = [UIButton new];
    [self.btnTop3 setBackgroundColor:UIColor.blackColor];
    self.btnTop3.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:self.btnTop3];
    self.btnTop3.layer.masksToBounds = YES;
    self.btnTop3.layer.cornerRadius = 2;
    [self.btnTop3 setTitle:@"3-Top" forState:UIControlStateNormal];
    [self.btnTop3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.btnTop1.mas_bottom).offset(20);
        make.width.mas_equalTo(70.f);
        make.height.mas_equalTo(20.f);
    }];
    [self.btnTop3 addTarget:self action:@selector(btnTop3Action) forControlEvents:UIControlEventTouchUpInside];
    
    self.btnTop4 = [UIButton new];
    [self.btnTop4 setBackgroundColor:UIColor.blackColor];
    self.btnTop4.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:self.btnTop4];
    self.btnTop4.layer.masksToBounds = YES;
    self.btnTop4.layer.cornerRadius = 2;
    [self.btnTop4 setTitle:@"4-Top" forState:UIControlStateNormal];
    [self.btnTop4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right).offset(-40);
        make.centerY.equalTo(self.btnTop1).offset(20);
        make.width.mas_equalTo(76.f);
        make.height.mas_equalTo(20.f);
    }];
    [self.btnTop4 addTarget:self action:@selector(btnTop4Action) forControlEvents:UIControlEventTouchUpInside];
    
    self.btnTop5 = [UIButton new];
    [self.btnTop5 setBackgroundColor:UIColor.blackColor];
    self.btnTop5.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:self.btnTop5];
    self.btnTop5.layer.masksToBounds = YES;
    self.btnTop5.layer.cornerRadius = 2;
    [self.btnTop5 setTitle:@"5-Top" forState:UIControlStateNormal];
    [self.btnTop5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right).offset(-40);
        make.top.equalTo(self.btnTop4.mas_bottom).offset(20);
        make.width.mas_equalTo(76.f);
        make.height.mas_equalTo(20.f);
    }];
    [self.btnTop5 addTarget:self action:@selector(btnTop5Action) forControlEvents:UIControlEventTouchUpInside];

    self.btnLeft1 = [UIButton new];
    [self.btnLeft1 setBackgroundColor:UIColor.blackColor];
    self.btnLeft1.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:self.btnLeft1];
    [self.btnLeft1 setTitle:@"arrowLeft" forState:UIControlStateNormal];
    [self.btnLeft1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view).offset(-60);
        make.width.mas_equalTo(76.f);
        make.height.mas_equalTo(30.f);
        make.left.offset(80);
    }];
    [self.btnLeft1 addTarget:self action:@selector(btnLeft1Action) forControlEvents:UIControlEventTouchUpInside];
    
    self.btnLeft2 = [UIButton new];
    [self.btnLeft2 setBackgroundColor:UIColor.blackColor];
    self.btnLeft2.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:self.btnLeft2];
    [self.btnLeft2 setTitle:@"2-Left" forState:UIControlStateNormal];
    [self.btnLeft2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view).offset(30);
        make.height.mas_equalTo(30.f);
        make.left.offset(80);
    }];
    [self.btnLeft2 addTarget:self action:@selector(btnLeft2Action) forControlEvents:UIControlEventTouchUpInside];
    
    self.btnRight1 = [UIButton new];
    [self.btnRight1 setBackgroundColor:UIColor.blackColor];
    self.btnRight1.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:self.btnRight1];
    [self.btnRight1 setTitle:@"arrowRight" forState:UIControlStateNormal];
    [self.btnRight1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view);
        make.width.mas_equalTo(80.f);
        make.height.mas_equalTo(30.f);
        make.right.equalTo(self.view.mas_right).offset(-30);
    }];
    [self.btnRight1 addTarget:self action:@selector(btnRight1Action) forControlEvents:UIControlEventTouchUpInside];
 
    self.btnRight2 = [UIButton new];
    [self.btnRight2 setTitle:@"2-Bottom" forState:UIControlStateNormal];
    [self.btnRight2 setBackgroundColor:UIColor.blackColor];
    self.btnRight2.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:self.btnRight2];
    [self.btnRight2 setTitle:@"2-Right" forState:UIControlStateNormal];
    [self.btnRight2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view).offset(60);
        make.width.mas_equalTo(80.f);
        make.height.mas_equalTo(30.f);
        make.right.equalTo(self.view.mas_right).offset(-30);
    }];
    [self.btnRight2 addTarget:self action:@selector(btnRight2Action) forControlEvents:UIControlEventTouchUpInside];
    
  
    self.btnBtm1 = [UIButton new];
    [self.btnBtm1 setBackgroundColor:UIColor.blackColor];
    self.btnBtm1.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:self.btnBtm1];
    [self.btnBtm1 setTitle:@"1-Bottom" forState:UIControlStateNormal];
    [self.btnBtm1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(-80);
        make.width.mas_equalTo(76.f);
        make.height.mas_equalTo(26.f);
        make.left.offset(30);
    }];
    [self.btnBtm1 addTarget:self action:@selector(btnBtm1Action) forControlEvents:UIControlEventTouchUpInside];
    
    self.btnBtm2 = [UIButton new];
    [self.view addSubview:self.btnBtm2];
    [self.btnBtm2 setTitle:@"2-Bottom" forState:UIControlStateNormal];
    [self.btnBtm2 setBackgroundColor:UIColor.blackColor];
    self.btnBtm2.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.btnBtm2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.btnBtm1.mas_bottom).offset(20);
        make.width.mas_equalTo(76.f);
        make.height.mas_equalTo(26.f);
        make.left.offset(30);
    }];
    [self.btnBtm2 addTarget:self action:@selector(btnBtm2Action) forControlEvents:UIControlEventTouchUpInside];
    
    self.btnBtm3 = [UIButton new];
    [self.btnBtm3 setBackgroundColor:UIColor.blackColor];
    self.btnBtm3.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:self.btnBtm3];
    [self.btnBtm3 setTitle:@"3-arrowBottom" forState:UIControlStateNormal];
    [self.btnBtm3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(-30);
        make.width.mas_equalTo(170.f);
        make.right.equalTo(self.view.mas_right).offset(-16);
    }];
    [self.btnBtm3 addTarget:self action:@selector(btnBtm3Action) forControlEvents:UIControlEventTouchUpInside];
    
    self.btnBtm4 = [UIButton new];
    [self.view addSubview:self.btnBtm4];
    [self.btnBtm4 setTitle:@"4-Bottom" forState:UIControlStateNormal];
    [self.btnBtm4 setBackgroundColor:UIColor.blackColor];
    self.btnBtm4.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.btnBtm4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.btnBtm3.mas_top).offset(-20);
        make.width.mas_equalTo(76.f);
        make.height.mas_equalTo(26.f);
        make.right.equalTo(self.view.mas_right).offset(-30);
    }];
    [self.btnBtm4 addTarget:self action:@selector(btnBtm4Action) forControlEvents:UIControlEventTouchUpInside];
    
    self.btnBtm5 = [UIButton new];
    [self.view addSubview:self.btnBtm5];
    [self.btnBtm5 setTitle:@"5-Bottom" forState:UIControlStateNormal];
    [self.btnBtm5 setBackgroundColor:UIColor.blackColor];
    self.btnBtm5.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.btnBtm5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.btnBtm4.mas_top).offset(-20);
        make.width.mas_equalTo(76.f);
        make.height.mas_equalTo(26.f);
        make.right.equalTo(self.view.mas_right).offset(-30);
    }];
    [self.btnBtm5 addTarget:self action:@selector(btnBtm5Action) forControlEvents:UIControlEventTouchUpInside];
    
}


// 箭头上
- (void)btnTop1Action {
    CLFlexibleBubbleConfig *config = [CLFlexibleBubbleConfig new];
    config.bubbleType = FlexibleBubbleTypeArrowTop;
    config.labelHPadding = 12;
    config.labelVPadding = 4;
    config.bubbleMaxWidth = 200;
    config.sideEdge = 10;
    CLFlexibleBubble *bubble = [[CLFlexibleBubble alloc] initWithBubbleConfig:config];
    [bubble showByControlTarget:self.btnTop1 withShowText:@"我是小气泡我是小气泡我是小气泡我是小气泡"];
    [bubble autoDismissAtTimeInterval:2];
}

- (void)btnTop2Action {
    CLFlexibleBubbleConfig *config = [CLFlexibleBubbleConfig new];
    config.bubbleType = FlexibleBubbleTypeArrowTop;
    config.labelHPadding = 12;
    config.labelVPadding = 4;
    config.sideEdge = 40;
    config.arrowOffset = 8;
    config.titleFont = [UIFont boldSystemFontOfSize:14];
    config.titleColor = UIColor.redColor;
    CLFlexibleBubble *bubble = [[CLFlexibleBubble alloc] initWithBubbleConfig:config];
    [bubble showByControlTarget:self.btnTop2 withShowText:@"我是小气泡"];
}

- (void)btnTop3Action {
    CLFlexibleBubbleConfig *config = [CLFlexibleBubbleConfig new];
    config.bubbleType = FlexibleBubbleTypeArrowTop;
    config.labelHPadding = 12;
    config.labelVPadding = 4;
    CLFlexibleBubble *bubble = [[CLFlexibleBubble alloc] initWithBubbleConfig:config];
    CGRect rect =  [self.btnTop3 convertRect:self.btnTop3.bounds toView:self.view];
    [bubble showAtTopVCWithRect:rect withShowText:@"我是小气泡我是小气泡" parentView:self.view];
}

- (void)btnTop4Action {
    CLFlexibleBubbleConfig *config = [CLFlexibleBubbleConfig new];
    config.bubbleType = FlexibleBubbleTypeArrowTop;
    config.labelHPadding = 12;
    config.labelVPadding = 4;
    config.sideEdge = 40;
    CLFlexibleBubble *bubble = [[CLFlexibleBubble alloc] initWithBubbleConfig:config];
    [bubble showByControlTarget:self.btnTop4 withShowText:@"我是小气泡"];
}

- (void)btnTop5Action {
    CLFlexibleBubbleConfig *config = [CLFlexibleBubbleConfig new];
    config.bubbleType = FlexibleBubbleTypeArrowTop;
    config.labelHPadding = 12;
    config.labelVPadding = 4;
    config.sideEdge = 0;
    CLFlexibleBubble *bubble = [[CLFlexibleBubble alloc] initWithBubbleConfig:config];
    [bubble showByControlTarget:self.btnTop5 withShowText:@"我是小气泡我是小气泡"];
}


//- (void)btn3Action {
//    CLFlexibleBubbleConfig *config = [CLFlexibleBubbleConfig new];
//    config.bubbleType = FlexibleBubbleTypeArrowTop;
//    config.labelHPadding = 12;
//    config.labelVPadding = 6;
//    config.arrowOffset = 34;
//    config.bubbleMaxWidth = 200;
//    config.labelFont = [TXSakura getFontWithPath:@"14"];
//    CLFlexibleBubble *bubble = [[CLFlexibleBubble alloc] initWithBubbleConfig:config];
//    CGRect rect =  [self.btn3 convertRect:self.btn3.bounds toView:self.view];
//    rect = CGRectMake(300, 60, 40, 30);
//    [bubble showAtTopVCWithRect:rect withShowText:@"我是小气泡我是小气泡我是小气泡我是小气泡" parentView:self.view];
//    [bubble autoDismissAtTimeInterval:3];
//}

// 箭头左右
- (void)btnLeft1Action {
    CLFlexibleBubbleConfig *config = [CLFlexibleBubbleConfig new];
    config.bubbleType = FlexibleBubbleTypeArrowLeft;
    config.labelHPadding = 12;
    config.labelVPadding = 4;
    config.arrowOffset = 8;
    CLFlexibleBubble *bubble = [CLFlexibleBubble bubbleWithConfig:config];
    CGRect rect =  [self.btnLeft1 convertRect:self.btnLeft1.bounds toView:self.view];
//    bubble.arrowX = rect.origin.x+60;
    [bubble showAtTopVCWithRect:rect withShowText:@"我是小气泡我是小气泡" parentView:self.view];
}

- (void)btnLeft2Action {
    CLFlexibleBubbleConfig *config = [CLFlexibleBubbleConfig new];
    config.bubbleType = FlexibleBubbleTypeArrowLeft;
    config.labelHPadding = 12;
    config.labelVPadding = 4;
    config.arrowOffset = 16;
    CLFlexibleBubble *bubble = [CLFlexibleBubble bubbleWithConfig:config];
    CGRect rect =  [self.btnLeft2 convertRect:self.btnLeft2.bounds toView:self.view];
//    bubble.arrowX = rect.origin.x+60;
    [bubble showAtTopVCWithRect:rect withShowText:@"我是小气泡我是小气泡我是小气泡我是小气泡我是小气泡我是小气泡" parentView:self.view];
}

- (void)btnRight1Action {
    CLFlexibleBubbleConfig *config = [CLFlexibleBubbleConfig new];
    config.bubbleType = FlexibleBubbleTypeArrowRight;
    config.labelHPadding = 12;
    config.labelVPadding = 4;
    config.arrowOffset = 10;
    CLFlexibleBubble *bubble = [[CLFlexibleBubble alloc] initWithBubbleConfig:config];
    CGRect rect =  [self.btnRight1 convertRect:self.btnRight1.bounds toView:self.view];
    [bubble showAtTopVCWithRect:rect withShowText:@"我是小气泡我是小气泡" parentView:self.view];
}

- (void)btnRight2Action {
    CLFlexibleBubbleConfig *config = [CLFlexibleBubbleConfig new];
    config.bubbleType = FlexibleBubbleTypeArrowRight;
    config.labelHPadding = 12;
    config.labelVPadding = 4;
    config.arrowOffset = 8;
    CLFlexibleBubble *bubble = [[CLFlexibleBubble alloc] initWithBubbleConfig:config];
    CGRect rect =  [self.btnRight2 convertRect:self.btnRight2.bounds toView:self.view];
    [bubble showAtTopVCWithRect:rect withShowText:@"我是小气泡我是小气泡我是小气泡我是小气泡" parentView:self.view];
}


- (void)btnBtm1Action {
    CLFlexibleBubbleConfig *config = [CLFlexibleBubbleConfig new];
    config.bubbleType = FlexibleBubbleTypeArrowBottom;
    config.labelHPadding = 12;
    config.labelVPadding = 4;
    config.titleColor = UIColor.orangeColor;
    config.bgColor = UIColor.purpleColor;
    CLFlexibleBubble *bubble = [[CLFlexibleBubble alloc] initWithBubbleConfig:config];
    CGRect rect =  [self.btnBtm1 convertRect:self.btnBtm1.bounds toView:self.view];
    [bubble showAtTopVCWithRect:rect withShowText:@"我是小气泡我是小气泡" parentView:self.view];
}

- (void)btnBtm2Action {
    CLFlexibleBubbleConfig *config = [CLFlexibleBubbleConfig new];
    config.bubbleType = FlexibleBubbleTypeArrowBottom;
    config.labelHPadding = 12;
    config.labelVPadding = 4;
    config.sideEdge = 30;
    CLFlexibleBubble *bubble = [[CLFlexibleBubble alloc] initWithBubbleConfig:config];
    CGRect rect =  [self.btnBtm2 convertRect:self.btnBtm2.bounds toView:self.view];
    [bubble showAtTopVCWithRect:rect withShowText:@"我是小气泡我是小气泡" parentView:self.view];
}

- (void)btnBtm3Action {
    CLFlexibleBubbleConfig *config = [CLFlexibleBubbleConfig new];
    config.bubbleType = FlexibleBubbleTypeArrowBottom;
    config.labelHPadding = 12;
    config.labelVPadding = 4;
    config.titleFont = [UIFont systemFontOfSize:10];
    CLFlexibleBubble *bubble = [[CLFlexibleBubble alloc] initWithBubbleConfig:config];
    CGRect rect =  [self.btnBtm3 convertRect:self.btnBtm3.bounds toView:self.view];
    [bubble showAtTopVCWithRect:rect withShowText:@"我是小气泡我是小气泡我是小气泡我是小气泡" parentView:self.view];
}

- (void)btnBtm4Action {
    CLFlexibleBubbleConfig *config = [CLFlexibleBubbleConfig new];
    config.bubbleType = FlexibleBubbleTypeArrowBottom;
    config.labelHPadding = 12;
    config.labelVPadding = 4;
    config.sideEdge = 0;
    CLFlexibleBubble *bubble = [[CLFlexibleBubble alloc] initWithBubbleConfig:config];
    CGRect rect =  [self.btnBtm4 convertRect:self.btnBtm4.bounds toView:self.view];
    [bubble showAtTopVCWithRect:rect withShowText:@"我是小气泡我是小气泡" parentView:self.view];
}

- (void)btnBtm5Action {
    CLFlexibleBubbleConfig *config = [CLFlexibleBubbleConfig new];
    config.bubbleType = FlexibleBubbleTypeArrowBottom;
    config.labelHPadding = 12;
    config.labelVPadding = 4;
    config.sideEdge = 30;
    CLFlexibleBubble *bubble = [[CLFlexibleBubble alloc] initWithBubbleConfig:config];
    CGRect rect =  [self.btnBtm5 convertRect:self.btnBtm5.bounds toView:self.view];
    [bubble showAtTopVCWithRect:rect withShowText:@"我是小气泡我是小气泡" parentView:self.view];
}

@end
