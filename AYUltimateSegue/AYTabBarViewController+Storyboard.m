//
//  AYTabBarViewController+Storyboard.m
//  AYUltimateSegue
//
//  Created by Andrey Yastrebov on 24.04.14.
//  Copyright (c) 2014 AYastrebov. All rights reserved.
//

#import "AYTabBarViewController+Storyboard.h"

#import "AYFirstViewController.h"
#import "AYSecondViewController.h"
#import "AYThirdViewController.h"

@implementation AYTabBarViewController (Storyboard)

- (void)tabBarToFirstSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Do any additional setup.
    //AYFirstViewController *viewController = [segue destinationViewController];
}

- (void)tabBarToSecondSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Do any additional setup.
    //AYSecondViewController *viewController = [segue destinationViewController];
}

- (void)tabBarToThirdSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Do any additional setup.
    //AYThirdViewController *viewController = [segue destinationViewController];
}

@end
