//
//  CLFlexibleBubbleArrow.m
//  FlexibleBubble
//
//  Created by Climb 王 on 2022/5/19.
//

#import "CLFlexibleBubbleArrow.h"
#import "Masonry.h"

@interface CLFlexibleBubbleArrow()

@property (nonatomic, strong) UIColor *backColor;

@end

@implementation CLFlexibleBubbleArrow

- (instancetype)initWithFrame:(CGRect)frame Color:(UIColor *)backColor; {
    if (self = [super initWithFrame:frame]) {
        self.opaque = NO;
        self.backColor = backColor;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextClearRect(ctx, rect);
    
    CGFloat arrowwid = rect.size.width;
    CGFloat arrowhei = rect.size.height;
    CGContextMoveToPoint(ctx, 0, arrowhei);
    CGContextAddLineToPoint(ctx, arrowwid/2, 0);
    CGContextAddLineToPoint(ctx, arrowwid, arrowhei);
    
    [self.backColor set];
    CGContextClosePath(ctx);
    CGContextFillPath(ctx);
}
@end


@implementation CLFlexibleBubbleTextView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.titleLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.inset(self.vPadding);
        make.left.right.inset(self.hPadding);
    }];
}

- (void)configData:(NSString *)title {
    self.titleLabel.text = title;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.textColor = UIColor.whiteColor;
    }
    return _titleLabel;
}
@end
