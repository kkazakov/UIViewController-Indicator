//
//  UIViewController+Indicator.m
//
//  Created by Krasimir Kazakov on 2/11/13.
//  Copyright (c) 2013 Krasimir Kazakov. All rights reserved.
//
// This code is distributed under the terms and conditions of the MIT license.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

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
