//
//  CLFlexibleBubbleConfig.h
//  FlexibleBubble
//
//  Created by Climb 王 on 2022/5/19.
//

#import <Foundation/Foundation.h>


// bubble的配置项

NS_ASSUME_NONNULL_BEGIN
// 类型枚举，Top：箭头在上；Bottom：箭头在下 ： Left：箭头在做； Right：箭头在右
typedef enum : NSUInteger {
    FlexibleBubbleTypeArrowTop = 0,
    FlexibleBubbleTypeArrowBottom,
    FlexibleBubbleTypeArrowLeft,
    FlexibleBubbleTypeArrowRight,
} FlexibleBubbleType;

@interface CLFlexibleBubbleConfig : NSObject

/// bubble类型枚举 - 默认arrowTop（箭头向上🔼）
@property (nonatomic, assign) FlexibleBubbleType bubbleType;
/// 箭头尺寸大小 - 默认（8,4）
@property (nonatomic, assign) CGSize arrowSize;
/// 弹出框圆角 - 默认4
@property (nonatomic, assign) CGFloat cornerRadius;
/// 弹出框底色  - 默认品牌色brand_color
@property (nonatomic, strong) UIColor *bgColor;
/** label距在气泡里的的padding */
@property (nonatomic, assign) CGFloat labelHPadding;//默认8
@property (nonatomic, assign) CGFloat labelVPadding;//默认2
/// label的字体 - 默认12
@property (nonatomic, strong) UIFont *titleFont;
/// label的颜色 - 默认白色
@property (nonatomic, strong) UIColor *titleColor;
/// label的行数 - 默认0
@property (nonatomic, assign) NSInteger labelNumberOfLines;
/// arrow箭头偏移 - 默认0 表示在控件中心（水平和竖直方向）
///（对top和bottom类型，arrowOffset指气泡距离屏幕两侧间距，不包括arrow本身size）；
///（对left和right类型，arrowOffset指从目标控件的orginY向下多少偏移距离，不包括arrow本身size）；
@property (nonatomic, assign) CGFloat arrowOffset;
/// arrow距离控件的间隔； 默认2
@property (nonatomic, assign) CGFloat arrowSpace;
/// 气泡距离屏幕视图的左右padding - 默认16
@property (nonatomic, assign) CGFloat sideEdge;
/// 气泡显示的最大宽度， - 默认170
@property (nonatomic, assign) CGFloat bubbleMaxWidth;

@end

NS_ASSUME_NONNULL_END
