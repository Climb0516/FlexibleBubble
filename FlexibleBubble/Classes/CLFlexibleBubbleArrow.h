//
//  CLFlexibleBubbleArrow.h
//  FlexibleBubble
//
//  Created by Climb 王 on 2022/5/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CLFlexibleBubbleArrow : UIView

- (instancetype)initWithFrame:(CGRect)frame Color:(UIColor *)backColor;

@end


@interface CLFlexibleBubbleTextView : UIView

@property (nonatomic, strong) UILabel *titleLabel;
/** label距window的的padding */
@property (nonatomic, assign) CGFloat hPadding;
@property (nonatomic, assign) CGFloat vPadding;//针对有的top和bottom的padding和left/right的不同
- (void)configData:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
