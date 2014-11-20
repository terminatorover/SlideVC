//
//  RGSecondTopViewController.m
//  RGSliderMoveController
//
//  Created by ROBERA GELETA on 11/18/14.
//  Copyright (c) 2014 ROBERA GELETA. All rights reserved.
//

#import "RGSecondTopViewController.h"

@interface RGSecondTopViewController ()

@end

@implementation RGSecondTopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonTapped:(id)sender
{
    NSLog(@"String");
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
