//
//  UIViewController+CLExtension.h
//  FlexibleBubble
//
//  Created by Climb 王 on 2022/5/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (CLExtension)


/**
 获取当前顶部ViewController
 @return ViewController
 */
+ (UIViewController *)cl_topViewController;

@end


@interface UIWindow (CLExtension)

@property (nonatomic, class) UIWindow *cl_mainWindow;

@end

NS_ASSUME_NONNULL_END
