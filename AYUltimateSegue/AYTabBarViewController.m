//
//  AYTabBarViewController.m
//  AYUltimateSegue
//
//  Created by Andrey Yastrebov on 24.04.14.
//  Copyright (c) 2014 AYastrebov. All rights reserved.
//

#import "AYTabBarViewController.h"
#import "AYTabBarViewController+Storyboard.h"

@interface AYTabBarViewController ()

@end

@implementation AYTabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self performTabSegueWithIdentifier:@"tabBarToFirstSegue"
                             storyboard:@"AYFirstStoryboard"
                               tabIndex:0
                                 sender:self];
    
    [self performTabSegueWithIdentifier:@"tabBarToSecondSegue"
                             storyboard:@"AYSecondStoryboard"
                               tabIndex:1
                                 sender:self];
    
    [self performTabSegueWithIdentifier:@"tabBarToThirdSegue"
                             storyboard:@"AYThirdStoryboard"
                               tabIndex:2
                                 sender:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
