//
//  UIViewController+CLExtension.m
//  FlexibleBubble
//
//  Created by Climb 王 on 2022/5/19.
//

#import "UIViewController+CLExtension.h"

@implementation UIViewController (CLExtension)

+ (UIViewController *)cl_topViewController{
    __block UIViewController *vc = [UIWindow.cl_mainWindow rootViewController];// 获取不到vc
    if (!vc) {
        vc = UIApplication.sharedApplication.keyWindow.rootViewController;
    }
   
    if (!vc) {
        [[UIApplication sharedApplication].windows enumerateObjectsUsingBlock:^(__kindof UIWindow * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj.rootViewController) {
                vc = obj.rootViewController;
                *stop = YES;
            }
        }];
    }
    
    while ([vc isKindOfClass:[UINavigationController class]] ||
           [vc isKindOfClass:[UITabBarController class]] ||
           vc.presentedViewController ) {
        if ( [vc isKindOfClass:[UINavigationController class]] )
            vc = [(UINavigationController *)vc topViewController];
        if ( [vc isKindOfClass:[UITabBarController class]] )
            vc = [(UITabBarController *)vc selectedViewController];
        if ( vc.presentedViewController )
            vc = vc.presentedViewController;
    }
    return vc;
}

@end

@implementation UIWindow (CLExtension)

__weak static UIWindow *_cl_mainWindow = nil;

+ (UIWindow *)cl_mainWindow{
    if (!_cl_mainWindow) {
        _cl_mainWindow = [UIApplication.sharedApplication.delegate window];
    }
    return _cl_mainWindow;
}

+ (void)setCl_mainWindow:(UIWindow *)cl_mainWindow{
    _cl_mainWindow = cl_mainWindow;
}


@end
