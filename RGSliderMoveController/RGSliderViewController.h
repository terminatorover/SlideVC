//
//  RGSliderViewController.h
//  RGSliderMoveController
//
//  Created by ROBERA GELETA on 11/18/14.
//  Copyright (c) 2014 ROBERA GELETA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RGSliderViewController : UIViewController
- (instancetype)initWithLeftViewController:(UIViewController *)leftViewController   topViewController:(UIViewController *)topViewController;
- (void)addViewController:(UIViewController *)viewController;
@end

@interface UIViewController (RGSliderViewController)

- (RGSliderViewController *)sliderViewController;
@end