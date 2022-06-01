
# 小气泡 FlexibleBubble
## 小气泡主要有 展示类 ·FlexibleBubble · 和  配置类·FlexibleBubbleConfig·
## FlexibleBubble
FlexibleBubble负责展示，里面绘制了气泡的布局和箭头以及承载的文字显示，提供根据配置展示不同类型展示规则的能力。

初始化方法两种：
```
// 初始化类型
+ (id)bubbleWithConfig:(FlexibleBubbleConfig *)bubbleConfig;
// 实例方法初始化
- (instancetype)initWithBubbleConfig:(FlexibleBubbleConfig *)bubbleConfig;
```

展示类型
气泡箭头可以自由选择方向：
```
// 类型枚举，Top：箭头在上；Bottom：箭头在下 ： Left：箭头在做； Right：箭头在右
typedef enum : NSUInteger {
    FlexibleBubbleTypeArrowTop = 0,
    FlexibleBubbleTypeArrowBottom,
    FlexibleBubbleTypeArrowLeft,
    FlexibleBubbleTypeArrowRight,
} LBBubbleType;
```

展示方法：
1. 可以传入frame，parentView可为空时默认时当前展示视图；
2. 可以传入目标控件，该组件会在组件内部根据控件获取frame，展示气泡；
```
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
```

支持气泡自动消失
调用 `[bubble autoDismissAtTimeInterval:2];` 执行自动消失

## FlexibleBubbleConfig
气泡配置，提供下面配置能力：
1. 自由选择箭头方向（上下左右）
2. 箭头尺寸大小
3. 弹出框圆角
4. 弹出框底色
5. label距在气泡里的的padding
6. label字体的属性
7. arrow箭头偏移
8. arrow箭头距离目标控件的间隔space
9. 气泡距离屏幕视图的左/右padding
10. 气泡显示的最大宽度

详细属性如下：
```
@interface FlexibleBubbleConfig : NSObject

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
/// arrow偏移 - 默认0 表示在控件中心（水平和竖直方向）
///（对top和bottom类型，arrowOffset指气泡距离屏幕两侧间距，不包括arrow本身size）；
///（对left和right类型，arrowOffset指从目标控件的orginY向下多少偏移距离，不包括arrow本身size）；
@property (nonatomic, assign) CGFloat arrowOffset;
/// arrow距离控件的间隔； 默认2
@property (nonatomic, assign) CGFloat arrowSpace;
/// 气泡距离父视图的padding - 默认16
@property (nonatomic, assign) CGFloat sideEdge;
/// 气泡最大宽度， - 默认170
@property (nonatomic, assign) CGFloat bubbleMaxWidth;

@end
```


使用

1. 传入frame
```
FlexibleBubbleConfig *config = [FlexibleBubbleConfig new];
config.bubbleType = FlexibleBubbleTypeArrowRight;
config.labelHPadding = 12;
config.labelVPadding = 4;
config.arrowOffset = 10;
FlexibleBubble *bubble = [[FlexibleBubble alloc] initWithBubbleConfig:config];
CGRect rect =  [self.btnRight1 convertRect:self.btnRight1.bounds toView:self.view];
[bubble showAtTopVCWithRect:rect withShowText:@"我是小气泡我是小气泡" parentView:self.view];

```
    
2. 传入目标控件
```
FlexibleBubbleConfig *config = [FlexibleBubbleConfig new];
config.bubbleType = FlexibleBubbleTypeArrowTop;
config.labelHPadding = 12;
config.labelVPadding = 4;
config.bubbleMaxWidth = 200;
config.sideEdge = 10;
FlexibleBubble *bubble = [[FlexibleBubble alloc] initWithBubbleConfig:config];
[bubble showByControlTarget:self.btnTop1 withShowText:@"我是小气泡我是小气泡我是小气泡我是小气泡"];
[bubble autoDismissAtTimeInterval:2];
```

详细用法可去demo里查看。

Demo截图：

[![OHLFmt.jpg](https://s1.ax1x.com/2022/05/19/OHLFmt.jpg)](https://imgtu.com/i/OHLFmt)


## pod使用：
```
pod 'FlexibleBubble'

```


[![CI Status](https://img.shields.io/travis/王攀登/FlexibleBubble.svg?style=flat)](https://travis-ci.org/王攀登/FlexibleBubble)
[![Version](https://img.shields.io/cocoapods/v/FlexibleBubble.svg?style=flat)](https://cocoapods.org/pods/FlexibleBubble)
[![License](https://img.shields.io/cocoapods/l/FlexibleBubble.svg?style=flat)](https://cocoapods.org/pods/FlexibleBubble)
[![Platform](https://img.shields.io/cocoapods/p/FlexibleBubble.svg?style=flat)](https://cocoapods.org/pods/FlexibleBubble)

## Author

Climb
wangpandeng1223@163.com

## License

FlexibleBubble is available under the MIT license. See the LICENSE file for more info.
