//
//  DRProgressHUD.m
//  DeepCubeRobotControls
//
//  Created by user on 2017/7/19.
//  Copyright © 2017年 zoff. All rights reserved.
//

#import "DRProgressHUD.h"

@implementation DRProgressHUD
{
    UIImageView *boomView;
    UIImageView *deepView;
     BOOL animating;
}

+ (instancetype)shareInstance{
    static DRProgressHUD *share;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        share = [[self alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    });
    return share;
}
+ (void)show{
    UIView *toView = [self getkeyWindow].rootViewController.view;
    
    [self showHUDToView:toView];
}
+ (UIWindow *)getkeyWindow{
    NSEnumerator *frontToBackWindows = [UIApplication.sharedApplication.windows reverseObjectEnumerator];
    for (UIWindow *window in frontToBackWindows){
        BOOL windowOnMainScreen = window.screen == UIScreen.mainScreen;
        BOOL windowIsVisible = !window.hidden && window.alpha > 0;
        BOOL windowLevelNormal = window.windowLevel == UIWindowLevelNormal;
        
        if (windowOnMainScreen && windowIsVisible && windowLevelNormal) {
            return window;
            
        }
    }
    return nil;
}
+(void)showHUDToView:(UIView *)toView{
    UIView *contentView = [[UIView alloc]initWithFrame:CGRectMake(200, 300, 80, 80)];
    contentView.centerX = DRDEVICE_WIDTH *0.5;
    contentView.centerY = DRDEVICE_HEIGHT*0.5;
    contentView.backgroundColor = [UIColor clearColor];
    contentView.tag = 1111;
     DRProgressHUD *HUD = [DRProgressHUD shareInstance];
        for (UIView *subView in toView.subviews) {
        if ([subView isEqual:contentView]) {
            [subView removeFromSuperview];
        }
    }
   // HUD.contentView.backgroundColor = [UIColor clearColor];
    CGSize toView_size = toView.frame.size;
    HUD.frame = contentView.bounds;
    [toView addSubview:contentView];
    [contentView bringSubviewToFront:HUD];
    [contentView addSubview:HUD];
    [HUD startSpin];
  
    
    
}

+ (void)dismissHUD{
    UIView *toView = [self getkeyWindow].rootViewController.view;
    
    [self dismissHUDFromView:toView];
}

+(void)dismissHUDFromView:(UIView *)fromView{
    for (UIView *subView in fromView.subviews) {
        if (subView.tag == 1111) {
            DRProgressHUD *HUD = (DRProgressHUD *)subView.subviews.lastObject;
            [HUD stopSpin];
            [HUD removeFromSuperview];
            [subView removeFromSuperview];
        }
    }
    
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        boomView = [self boom];
        [self addSubview:boomView];
        deepView = [self deep];
        [self addSubview:deepView];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGSize self_size = self.frame.size;
    boomView.center = CGPointMake(self_size.width * 0.5, self_size.height * 0.5);
    deepView.center = CGPointMake(self_size.width * 0.5, self_size.height * 0.5);

}
- (void) spinWithOptions: (UIViewAnimationOptions) options {
    // this spin completes 360 degrees every 2 seconds
    [UIView animateWithDuration: 0.3f
                          delay: 0.0f
                        options: options
                     animations: ^{
                        boomView.transform = CGAffineTransformRotate(boomView.transform, M_PI / 2);
                     }
                     completion: ^(BOOL finished) {
                         if (finished) {
                             if (animating) {
                                 // if flag still set, keep spinning with constant speed
                                 [self spinWithOptions: UIViewAnimationOptionCurveLinear];
                             } else if (options != UIViewAnimationOptionCurveEaseOut) {
                                 // one last spin, with deceleration
                                 [self spinWithOptions: UIViewAnimationOptionCurveEaseOut];
                             }
                         }
                     }];
}

- (UIImageView *)boom{
 
    UIImageView   *boom = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    boom.image =DRImageNamed(@"DR_Common_Loading_Halo");
  
    return boom;
}
- (UIImageView *)deep{
    
    UIImageView *deep = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    deep.image =DRImageNamed(@"DR_Common_Loading_Head");
  
    return deep;
}
- (void) startSpin {
    
    if (!animating) {
        animating = YES;
        [self spinWithOptions: UIViewAnimationOptionCurveEaseIn];
    }
}

- (void) stopSpin {

    animating = NO;
}
@end
