//
//  NSString+CLExtension.h
//  FlexibleBubble
//
//  Created by Climb 王 on 2022/5/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (CLExtension)

+ (BOOL)isNotBlank:(NSString* _Nullable)source;
+ (BOOL)isBlank:(NSString* _Nullable)source;

// 计算文本size
- (CGSize)cl_boundingRectWithSize:(CGSize)size withFont:(UIFont *)font;

@end

NS_ASSUME_NONNULL_END
