//
//  UIViewController+Indicator.h
//
//  Created by Krasimir Kazakov on 2/11/13.
//  Copyright (c) 2013 Krasimir Kazakov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@class IndicatorController;


@interface UIViewController (Indicator)

-(void) loadingIndicator:(BOOL)display;

-(void) loadingIndicator:(BOOL)display
                scroller:(UIScrollView*) aScroller;

-(void) loadingIndicator:(BOOL)display
                    wait:(int)iWait;

-(void) loadingIndicator:(BOOL)display
                scroller:(UIScrollView*) aScroller
                    wait:(int)iWait;

@end
