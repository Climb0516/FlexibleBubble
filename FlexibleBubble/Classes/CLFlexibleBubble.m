//
//  CLFlexibleBubble.m
//  FlexibleBubble
//
//  Created by Climb 王 on 2022/5/19.
//

#import "CLFlexibleBubble.h"
#import "CLFlexibleBubbleArrow.h"
#import "NSString+CLExtension.h"
#import "UIViewController+CLExtension.h"

#define KHeight UIScreen.mainScreen.bounds.size.height
@interface CLFlexibleBubble ()

@property (nonatomic, strong) CLFlexibleBubbleTextView *showTextView;
@property (nonatomic, strong) CLFlexibleBubbleArrow *popArrow;
@property (nonatomic, strong) UIView *popView;
@property (nonatomic, strong) id targetView;
@property (nonatomic, assign) CGFloat visibleHeight;
@property (nonatomic, assign) CGRect targetViewFrame;
@property (nonatomic, copy) NSString *showText;
@property (nonatomic, assign) CGSize bubbleSize;//弹出框大小
@property (nonatomic, assign) BOOL noFrameAdjust;
@property (nonatomic, strong) CLFlexibleBubbleConfig *bubbleConfig;//bubble配置
@property (nonatomic, strong) NSTimer *autoDismissTimer;

@end

@implementation CLFlexibleBubble

+ (id)bubbleWithConfig:(CLFlexibleBubbleConfig *)bubbleConfig {
    return [[CLFlexibleBubble alloc] initWithBubbleConfig:bubbleConfig];
}

- (CLFlexibleBubbleConfig *)bubbleConfig {
    if (!_bubbleConfig) {
        _bubbleConfig = [CLFlexibleBubbleConfig new];
    }
    return _bubbleConfig;
}

- (instancetype)initWithBubbleConfig:(CLFlexibleBubbleConfig *)bubbleConfig {
    self = [super init];
    if (self) {
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor clearColor];
        if (bubbleConfig) {
            self.bubbleConfig = bubbleConfig;
        }
    }
    return self;
}


// 展示及赋值事件
- (void)showAtTopVCWithRect:(CGRect)rectFrame withShowText:(NSString *)showText parentView:(UIView *)parentView {
    self.noFrameAdjust = YES;
    self.visibleHeight = KHeight;

    self.targetViewFrame = rectFrame;
    self.bubbleSize = rectFrame.size;
    if (parentView) {
        [parentView addSubview:self];
    } else {
        [[UIViewController cl_topViewController].view addSubview:self];
    }

    [self configShowText:showText];
}

// 展示及赋值事件
- (void)showByControlTarget:(id)target withShowText:(NSString *)showText {
    self.visibleHeight = KHeight;
    self.targetView = target;
    if (![target isKindOfClass:[UIView class]] &&
        ![target isKindOfClass:[UIBarButtonItem class]]) {
        return;
    }
    [[UIViewController cl_topViewController].view addSubview:self];

    [self configShowText:showText];
}

// config赋值
- (void)configShowText:(NSString *)showText {
    self.showText = showText;
    CGFloat textWidth = [showText cl_boundingRectWithSize:CGSizeMake(MAXFLOAT, 17) withFont:self.bubbleConfig.titleFont].width ;
    CGFloat bubbleWidth = textWidth + 2*self.bubbleConfig.labelHPadding;
    bubbleWidth = (bubbleWidth > self.bubbleConfig.bubbleMaxWidth) ? self.bubbleConfig.bubbleMaxWidth : bubbleWidth;

    CGFloat textHeight = [showText cl_boundingRectWithSize:CGSizeMake(bubbleWidth-2*self.bubbleConfig.labelHPadding, MAXFLOAT) withFont:self.bubbleConfig.titleFont].height;
    CGFloat bubbleHeight = textHeight+2*self.bubbleConfig.labelVPadding;
    self.bubbleSize = CGSizeMake(bubbleWidth, bubbleHeight);
    self.showTextView = [[CLFlexibleBubbleTextView alloc] initWithFrame:CGRectMake(0, 0, self.bubbleSize.width, self.bubbleSize.height)];
    self.showTextView.hPadding = self.bubbleConfig.labelHPadding;
    self.showTextView.vPadding = self.bubbleConfig.labelVPadding;

    self.showTextView.titleLabel.font = self.bubbleConfig.titleFont;
    self.showTextView.titleLabel.textColor = self.bubbleConfig.titleColor;
    self.showTextView.titleLabel.numberOfLines = self.bubbleConfig.labelNumberOfLines;
    [self.showTextView configData:showText];
    self.showTextView.backgroundColor = self.bubbleConfig.bgColor;
    [self.popView addSubview:self.showTextView];
    [self addSubview:self.popArrow];
}

// 自动消失方法
- (void)autoDismissAtTimeInterval:(NSTimeInterval)timeInterval {
    [self.autoDismissTimer invalidate];
    self.autoDismissTimer = nil;
    self.autoDismissTimer = [NSTimer scheduledTimerWithTimeInterval:timeInterval
                                                             target:self
                                                           selector:@selector(autoDismissAnimatedDidFire:)
                                                           userInfo:nil
                                                            repeats:NO];
}

- (void)autoDismissAnimatedDidFire:(NSTimer *)theTimer {
    [self.autoDismissTimer invalidate];
    self.autoDismissTimer = nil;
    [self hideBubble];
}


// 隐藏事件
- (void)hideBubble {
    [self removeFromSuperview];
    if (self.bubbleHideDone) {
        self.bubbleHideDone();
    }
}


- (UIView *)popView {
    if (!_popView) {
        CGRect frame = [self getPopFrame];
        _popView = [[UIView alloc] initWithFrame:frame];
        _popView.layer.cornerRadius = self.bubbleConfig.cornerRadius;
        _popView.layer.masksToBounds = YES;
        [self addSubview:_popView];
    }
    return _popView;
}

- (CLFlexibleBubbleArrow *)popArrow {
    if (!_popArrow) {
        CGRect frame = [self getArrowFrame];
        _popArrow = [[CLFlexibleBubbleArrow alloc] initWithFrame:frame Color:self.bubbleConfig.bgColor];
        
        switch (self.bubbleConfig.bubbleType) {
            case FlexibleBubbleTypeArrowTop:
                _popArrow.transform = CGAffineTransformRotate(CGAffineTransformIdentity, 0);
                break;
            case FlexibleBubbleTypeArrowBottom:
                _popArrow.transform = CGAffineTransformRotate(CGAffineTransformIdentity, M_PI);
                break;
            case FlexibleBubbleTypeArrowLeft:
                _popArrow.transform = CGAffineTransformRotate(CGAffineTransformIdentity, M_PI*3/2);
                break;
            case FlexibleBubbleTypeArrowRight:
                _popArrow.transform = CGAffineTransformRotate(CGAffineTransformIdentity, M_PI/2);
                break;
            default:
                break;
        }
    }
    return _popArrow;
}

- (CGRect)targetViewFrame {
    CGRect targetFrame;
    if (CGRectEqualToRect(_targetViewFrame, CGRectZero)) {
        CGRect targetRect = [self.targetView bounds];
        UIWindow * window = [[[UIApplication sharedApplication] delegate] window];
        targetFrame = [self.targetView convertRect:targetRect toView:window];
        if (targetFrame.origin.y < 0) {
            targetFrame.origin.y = 0;
        }
        _targetViewFrame = targetFrame;
    }
    return _targetViewFrame;
}

- (CGPoint)targetViewCenter {
    CGRect targetFrame = self.targetViewFrame;
    CGFloat centerX = targetFrame.origin.x + targetFrame.size.width/2.0;
    CGFloat centerY = targetFrame.origin.y + targetFrame.size.height/2.0;
    return CGPointMake(centerX, centerY);
}

- (CGRect)getPopFrame {
    CGRect targetFrame = self.targetViewFrame;
    CGPoint targetCenter = self.targetViewCenter;
    
    CGFloat bubbleWidth = self.bubbleSize.width;
    CGFloat bubbleHeight = self.bubbleSize.height;
    CGRect popFrame = CGRectMake(targetFrame.origin.x, 0, bubbleWidth, bubbleHeight);
    
    CGFloat maxWidth = [UIViewController cl_topViewController].view.frame.size.width;

    CGPoint p = self.targetViewFrame.origin;
    
    CGFloat finalOriginX = 0;
    if (targetCenter.x > maxWidth/2) {
        // 按钮在视图右侧
        finalOriginX = p.x;
    } else {
        // 按钮在视图左侧
        finalOriginX = self.bubbleConfig.sideEdge;
        // 左侧起点限制
        if (finalOriginX < 0) {
            finalOriginX = 0;
        }
    }
    // 右侧计算如果超出maxWidth，则向左减坐标
    if (finalOriginX + _bubbleSize.width + self.bubbleConfig.sideEdge > maxWidth) {
        finalOriginX = maxWidth - _bubbleSize.width - self.bubbleConfig.sideEdge;
    }
    // 当气泡可以在范围区间内显示全，优先居中显示；
    if ((targetCenter.x + bubbleWidth/2 + self.bubbleConfig.sideEdge <= maxWidth) && (targetCenter.x - bubbleWidth/2 - self.bubbleConfig.sideEdge >= 0)) {
        finalOriginX = targetCenter.x - bubbleWidth/2;
    }
    
    
    CGFloat arrowSpace = self.bubbleConfig.arrowSpace;
    switch (self.bubbleConfig.bubbleType) {
        case FlexibleBubbleTypeArrowTop:
            popFrame.origin.y = CGRectGetMaxY(targetFrame) + self.bubbleConfig.arrowSize.height + arrowSpace;
            popFrame.origin.x = finalOriginX;
            break;
        case FlexibleBubbleTypeArrowBottom:
            popFrame.origin.y = CGRectGetMinY(targetFrame) - bubbleHeight - self.bubbleConfig.arrowSize.height - arrowSpace;
            popFrame.origin.x = finalOriginX;
            break;
        case FlexibleBubbleTypeArrowLeft:
            popFrame.origin.x = targetFrame.origin.x + targetFrame.size.width + self.bubbleConfig.arrowSize.width + arrowSpace;
            popFrame.origin.y = targetFrame.origin.y + targetFrame.size.height/2.0 - bubbleHeight/2.0;
            break;
        case FlexibleBubbleTypeArrowRight:
            popFrame.origin.x = targetFrame.origin.x - bubbleWidth - self.bubbleConfig.arrowSize.width - arrowSpace;
            popFrame.origin.y = targetFrame.origin.y + targetFrame.size.height/2.0 - bubbleHeight/2;
            break;
        default:
            break;
    }
    popFrame.origin.y = ceil(popFrame.origin.y);
    return popFrame;
}

- (CGRect)getArrowFrame {
    CGRect targetFrame = self.targetViewFrame;
    CGRect arrowFrame = CGRectMake(0, 0, self.bubbleConfig.arrowSize.width, self.bubbleConfig.arrowSize.height);
    CGFloat arrowSpace = self.bubbleConfig.arrowSpace;
    if (self.bubbleConfig.arrowOffset == 0) {
        if (self.bubbleConfig.bubbleType == FlexibleBubbleTypeArrowTop || self.bubbleConfig.bubbleType == FlexibleBubbleTypeArrowBottom) {
            // arrow为x时，默认是箭头在控件中间
            self.bubbleConfig.arrowOffset = self.targetViewFrame.size.width/2-arrowFrame.size.width/2.0;
        } else {
            // arrow为x时，默认是箭头在控件中间
            self.bubbleConfig.arrowOffset = self.targetViewFrame.size.height/2-arrowFrame.size.height/2.0;
        }
    }
    // 箭头旋转偏差
    CGFloat arrowRotateDiff = self.bubbleConfig.arrowSize.width/self.bubbleConfig.arrowSize.height;
    // popframe的y坐标
    CGFloat popFrameY = targetFrame.origin.y;
    switch (self.bubbleConfig.bubbleType) {
        case FlexibleBubbleTypeArrowTop:
            arrowFrame.origin.x = targetFrame.origin.x + self.bubbleConfig.arrowOffset;
            arrowFrame.origin.y = targetFrame.origin.y + targetFrame.size.height + arrowSpace;
            break;
        case FlexibleBubbleTypeArrowBottom:
            arrowFrame.origin.x = targetFrame.origin.x + self.bubbleConfig.arrowOffset;
            arrowFrame.origin.y = targetFrame.origin.y - self.bubbleConfig.arrowSize.height - arrowSpace;
            break;
        case FlexibleBubbleTypeArrowLeft:
            arrowFrame.origin.x = targetFrame.origin.x + targetFrame.size.width + arrowSpace + arrowRotateDiff;
            arrowFrame.origin.y = popFrameY + self.bubbleConfig.arrowOffset;
            break;
        case FlexibleBubbleTypeArrowRight:
            arrowFrame.origin.x = targetFrame.origin.x - arrowSpace - self.bubbleConfig.arrowSize.width - arrowRotateDiff;/*arrowRotateDiff是旋转导致的*/
            arrowFrame.origin.y = popFrameY + self.bubbleConfig.arrowOffset;
            break;
        default:
            break;
    }
    arrowFrame.origin.y = ceil(arrowFrame.origin.y);
    return arrowFrame;
}

- (void)setTargetView:(id)targetView {
    if (_targetView != targetView) {
        if ([targetView isKindOfClass:[UIView class]]) {
            _targetView = targetView;
        } else if ([targetView isKindOfClass:[UIBarButtonItem class]]) {
            if ([targetView customView]) {
                _targetView = [targetView customView];
            } else {
                NSAssert(1, @"Unsupport Type:Is not a View");
            }
        }
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.autoDismissTimer) {
        [self.autoDismissTimer invalidate];
        self.autoDismissTimer = nil;
    }
    [self hideBubble];
}

@end
