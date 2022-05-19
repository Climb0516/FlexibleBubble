//
//  NSString+CLExtension.m
//  FlexibleBubble
//
//  Created by Climb 王 on 2022/5/19.
//

#import "NSString+CLExtension.h"

#pragma mark - Extension
@implementation NSString (Extension)

+ (BOOL)isNotBlank:(NSString* _Nullable)source {
    if ([source isKindOfClass:[NSNull class]]) {
        return NO;
    }
    if ( source == nil || source.length == 0 ) {
        return NO;
    }
    
    return YES;
}
+ (BOOL)isBlank:(NSString* _Nullable)source {
    if ([source isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if (source == nil || source.length == 0 ) {
        return YES;
    }
    
    return NO;
}

- (CGSize)cl_boundingRectWithSize:(CGSize)size withFont:(UIFont *)font{
    CGRect frame = [self boundingRectWithSize:size
                                      options:NSStringDrawingUsesLineFragmentOrigin |
                                              NSStringDrawingUsesFontLeading
                                   attributes:@{NSFontAttributeName: font ? : [UIFont systemFontOfSize:12]}
                                      context:nil];
    
    return CGSizeMake(ceil(frame.size.width), ceil(frame.size.height));
}

@end

