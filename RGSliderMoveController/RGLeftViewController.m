//
//  RGLeftViewController.m
//  RGSliderMoveController
//
//  Created by ROBERA GELETA on 11/18/14.
//  Copyright (c) 2014 ROBERA GELETA. All rights reserved.
//

#import "RGLeftViewController.h"
#import "RGSliderViewController.h"
#import "RGSecondTopViewController.h"

typedef enum {
    BUTTON1 = 51,
    BUTTON2,
    BUTTON3,
} VC_CHOICES;


@interface RGLeftViewController ()

@end

@implementation RGLeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buttonPressed:(UIButton * )sender
{
    RGSliderViewController *parentVC =    self.sliderViewController ;
    NSArray *children =    parentVC.childViewControllers;
    NSLog(@"Tag: %d",sender.tag);
    switch (sender.tag) {
        case BUTTON1:
        {
            UIViewController *firstVC =[[UIViewController alloc]init];
            firstVC.view.backgroundColor = [UIColor grayColor];
            [self.sliderViewController addViewController:firstVC];
            [self toggleBack];
        }
            break;
        case BUTTON2:
        {
            UIViewController *secondVC =[[UIViewController alloc]init];
            secondVC.view.backgroundColor = [UIColor blueColor];
            [self.sliderViewController addViewController:secondVC];
            [self toggleBack];
        }
            break;
            
        case BUTTON3:
        {
            UIViewController *thirdVC =[[UIViewController alloc]init];
            thirdVC.view.backgroundColor = [UIColor redColor];
            [self.sliderViewController addViewController:thirdVC];
            [self toggleBack];
        }
            break;

    }
}

- (void)toggleBack
{
    if(_delegate && [_delegate respondsToSelector:@selector(toggleTopView)])
    {
        [_delegate toggleTopView];
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
