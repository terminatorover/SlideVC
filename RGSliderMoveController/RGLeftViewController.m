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

@interface RGLeftViewController ()

@end

@implementation RGLeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *topButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 300, 50)];
    topButton.backgroundColor = [UIColor grayColor];
    [topButton addTarget:self action:@selector(check) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:topButton];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-  (void)check
{
    NSLog(@"CHECK ");
}
- (IBAction)buttonPressed:(id)sender
{
    
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
