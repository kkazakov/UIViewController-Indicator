UIViewController+Indicator
==========================

####Category for ViewController, displaying loading indicator with MBProgressHUD (not included).

Right now it's using your app's delegate as primary window (the idea is to block it completely, without access to underlying UI elements).


The following methods are available:


```objc
-(void) loadingIndicator:(BOOL)display;

-(void) loadingIndicator:(BOOL)display
                scroller:(UIScrollView*) aScroller;

-(void) loadingIndicator:(BOOL)display
                    wait:(int)iWait;

-(void) loadingIndicator:(BOOL)display
                scroller:(UIScrollView*) aScroller
                    wait:(int)iWait;
```

####Usage:

This will display it after 2 seconds. If you want to display it immediately, use 0.1 as value. If you use 0 or don't specify it, the default 0.8 seconds will be used.

```objc

- (IBAction)reloadProfile:(id)sender
{
    [self loadingIndicator:YES scroller:self.tableView wait:2];
}

- (void) doneLoadingProfiles
{
    [self loadingIndicator:NO scroller:self.tableView];
}
```

If you specify scroller, like your TableView, then this will be blocked for scrolling, until you remove the indicator.

The project is ARC-based.
