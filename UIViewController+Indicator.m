//
//  UIViewController+Indicator.m
//
//  Created by Krasimir Kazakov on 2/11/13.
//  Copyright (c) 2013 Krasimir Kazakov. All rights reserved.
//

#import "UIViewController+Indicator.h"

@implementation UIViewController (Indicator)


-(void) loadingIndicatorShow:(int)waitSeconds
{
    AppDelegate * myDelegate = (AppDelegate*) (((AppDelegate*) [UIApplication sharedApplication].delegate));

    UIView * prevIndicator = [myDelegate.window viewWithTag:977];
    
    if (prevIndicator != nil) {
        return;
    }

    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:myDelegate.window];
    hud.tag = 977;
    
    
    [myDelegate.window addSubview:hud];

    hud.dimBackground = YES;
    hud.taskInProgress = YES;
    hud.graceTime = waitSeconds;
    hud.labelText = NSLocalizedString(@"Loading", @"");
    [hud show:YES];
}

-(void) loadingIndicatorHide
{
    AppDelegate * myDelegate = (AppDelegate*) (((AppDelegate*) [UIApplication sharedApplication].delegate));
    
    [MBProgressHUD hideAllHUDsForView:myDelegate.window animated:YES];
}

-(void) loadingIndicator:(BOOL)display
{
    if (display) {
        [self loadingIndicatorShow:0.8];
    } else {
        [self loadingIndicatorHide];
    }
}

-(void) loadingIndicator:(BOOL)display
                    wait:(int)iWait
{
    if (display) {
        [self loadingIndicatorShow:iWait];
    } else {
        [self loadingIndicatorHide];
    }
}

-(void) loadingIndicator:(BOOL)display
    scroller:(UIScrollView*) aScroller
{
    if (display) {
        aScroller.scrollEnabled = NO;
        [aScroller setContentOffset:aScroller.contentOffset animated:NO];
        [self loadingIndicatorShow:0.8];
    } else {
        [self loadingIndicatorHide];
        aScroller.scrollEnabled = YES;
    }
}

-(void) loadingIndicator:(BOOL)display
                scroller:(UIScrollView*) aScroller
                    wait:(int)iWait
{
    if (display) {
        aScroller.scrollEnabled = NO;
        [aScroller setContentOffset:aScroller.contentOffset animated:NO];
        [self loadingIndicatorShow:iWait];
    } else {
        [self loadingIndicatorHide];
        aScroller.scrollEnabled = YES;
    }
}

@end
