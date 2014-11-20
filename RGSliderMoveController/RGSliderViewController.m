//
//  RGSliderViewController.m
//  RGSliderMoveController
//
//  Created by ROBERA GELETA on 11/18/14.
//  Copyright (c) 2014 ROBERA GELETA. All rights reserved.
//

#import "RGSliderViewController.h"

@interface RGSliderViewController ()
@property (nonatomic) UIView *topView;
@end

@implementation RGSliderViewController
{
    CGPoint currentViewLocation;
    BOOL moveRight;
}

- (instancetype)initWithLeftViewController:(UIViewController *)leftViewController   topViewController:(UIViewController *)topViewController
{
    self = [super init];
    if(!self || leftViewController == nil || topViewController == nil )
    {
        return nil;
    }
    //-------Left VC
    [leftViewController willMoveToParentViewController:self];
    [self addChildViewController:leftViewController];
    leftViewController.view.frame = self.view.bounds;
    [self.view addSubview:leftViewController.view];
    [leftViewController didMoveToParentViewController:self];
    //-------
    [self addViewController:topViewController];
    
    return self;
}

//------------------
- (void)addViewController:(UIViewController *)viewController
{
    //------Remove the Current View and View Controller first
    UIViewController *topVC = [self topViewController];
    [topVC willMoveToParentViewController:nil];
    UIView *viewInsideTopView =   [self.topView subviews].firstObject;
    [viewInsideTopView removeFromSuperview];
    [topVC removeFromParentViewController];
    
    
    //---------------- Add the Top VC
    [viewController willMoveToParentViewController:self];
    [self addChildViewController:viewController];
    viewController.view.frame = self.view.bounds;
    [self.topView addSubview:viewController.view];
    [viewController didMoveToParentViewController:self];
}


- (UIViewController *)topViewController
{
    return  [self childViewControllers].lastObject;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    currentViewLocation = CGPointZero;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)topView
{
    if(!_topView)
    {
        _topView = [[UIView alloc]initWithFrame:self.view.bounds];

        UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(userIsPanning:)];
        [_topView addGestureRecognizer:panGestureRecognizer];
        [self.view addSubview:_topView];
    }
    return _topView;
}

- (void)userIsPanning:(UIPanGestureRecognizer *)panGestureRecognizer
{
    CGPoint touchLocation = [panGestureRecognizer translationInView:self.topView];
    CGFloat xMovement = touchLocation.x;
    if(panGestureRecognizer.state == UIGestureRecognizerStateBegan)
    {
        NSLog(@"%@",NSStringFromCGPoint(touchLocation));
        if(self.topView.frame.origin.x > self.topView.frame.size.width/2)
        {
            moveRight = YES;
        }
        else
        {
            moveRight = NO;
        }
    }
    if(panGestureRecognizer.state == UIGestureRecognizerStateChanged)
    {
        if(moveRight)
        {
            if(xMovement > 0 )
            {
                xMovement = 0;
            }
        }
        
        if(self.topView.frame.origin.x < 0)
        {
            xMovement = 0 ;
        }
        CGPoint move = CGPointMake(xMovement, 0);
        CGRect newFrame = CGRectMake(self.topView.frame.origin.x + move.x,0 , self.topView.frame.size.width, self.topView.frame.size.height);
        self.topView.frame = newFrame;
        [panGestureRecognizer setTranslation:CGPointZero inView:self.topView];
    }
    
    
    if(panGestureRecognizer.state == UIGestureRecognizerStateEnded)
    {
        if(self.topView.frame.origin.x > self.topView.frame.size.width / 2)
        {
            [UIView animateWithDuration:2
                                  delay:.1
                 usingSpringWithDamping:.8
                  initialSpringVelocity:5
                                options:UIViewAnimationOptionAllowUserInteraction
                             animations:^{
                                 CGRect mainViewFrame  = self.view.bounds;
                                 CGRect newViewFrame = CGRectMake(mainViewFrame.size.width /2, 0, mainViewFrame.size.width, mainViewFrame.size.height);
                                 self.topView.frame = newViewFrame;
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }];
        }
        else
        {
            [UIView animateWithDuration:2
                                  delay:.1
                 usingSpringWithDamping:.8
                  initialSpringVelocity:5
                                options:UIViewAnimationOptionAllowUserInteraction
                             animations:^{
                                 self.topView.frame = self.view.bounds;
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }];
        }
        

    }

}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end






@implementation UIViewController (RGSliderViewController)

- (RGSliderViewController * )sliderViewController
{
    return (RGSliderViewController *)self.parentViewController;
}

@end

