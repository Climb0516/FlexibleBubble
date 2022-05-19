//
//  CLFlexibleBubble.h
//  FlexibleBubble
//
//  Created by Climb 王 on 2022/5/19.
//

#import <UIKit/UIKit.h>
#import "CLFlexibleBubbleConfig.h"

NS_ASSUME_NONNULL_BEGIN

/*
 * 使用方式：：：
     LBGuidelineBubbleConfig *config = [LBGuidelineBubbleConfig new];
     config.bubbleType = LBBubbleTypeArrowRight;
     config.labelHPadding = 12;
     config.labelVPadding = 4;
     config.arrowOffset = 10;
     LBGuidelineBubble *bubble = [[LBGuidelineBubble alloc] initWithBubbleConfig:config];
     CGRect rect =  [self.btnRight1 convertRect:self.btnRight1.bounds toView:self.view];
     [bubble showAtTopVCWithRect:rect withShowText:@"我是小气泡我是小气泡" parentView:self.view];
 */
@interface CLFlexibleBubble : UIView

// 初始化类型
+ (id)bubbleWithConfig:(CLFlexibleBubbleConfig *)bubbleConfig;
// 实例方法初始化
- (instancetype)initWithBubbleConfig:(CLFlexibleBubbleConfig *)bubbleConfig;
/*
 * title：展示及赋值事件
 * param：target - 依附的控件；showText展示内容
 */
- (void)showByControlTarget:(id)target withShowText:(NSString *)showText;
/*
 * title：展示及赋值事件
 * param：rectFrame - 依附控件的的frame；showText展示内容
 * detail：rectFrame.size的width是popwindow最大宽度， rectFrame.size的height不重要随便填
 */
- (void)showAtTopVCWithRect:(CGRect)rectFrame withShowText:(NSString *)showText parentView:(UIView *)parentView;

// 自动消失方法
- (void)autoDismissAtTimeInterval:(NSTimeInterval)timeInterval;

- (void)hideBubble;

@property (nonatomic, copy) void (^bubbleHideDone)(void);

@end

NS_ASSUME_NONNULL_END
