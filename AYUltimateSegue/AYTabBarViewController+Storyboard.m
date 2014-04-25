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

- (void)tabBarToFirstSegue:(UIStoryboardSegue *)segue
                    sender:(id)sender
{
    // Do any additional setup.
    AYFirstViewController *viewController = nil;
    if ([segue.destinationViewController isKindOfClass:[UINavigationController class]])
    {
        UINavigationController *navigationController = [segue destinationViewController];
        viewController = (AYFirstViewController *)[navigationController topViewController];
    }
    else
    {
        viewController = [segue destinationViewController];
    }
}

- (void)tabBarToSecondSegue:(UIStoryboardSegue *)segue
                     sender:(id)sender
{
    // Do any additional setup.
    AYSecondViewController *viewController = nil;
    if ([segue.destinationViewController isKindOfClass:[UINavigationController class]])
    {
        UINavigationController *navigationController = [segue destinationViewController];
        viewController = (AYSecondViewController *)[navigationController topViewController];
    }
    else
    {
        viewController = [segue destinationViewController];
    }
}

- (void)tabBarToThirdSegue:(UIStoryboardSegue *)segue
                    sender:(id)sender
{
    // Do any additional setup.
    AYThirdViewController *viewController = nil;
    if ([segue.destinationViewController isKindOfClass:[UINavigationController class]])
    {
        UINavigationController *navigationController = [segue destinationViewController];
        viewController = (AYThirdViewController *)[navigationController topViewController];
        viewController.title = @"Third";
    }
    else
    {
        viewController = [segue destinationViewController];
    }
}

- (void)removeViewControllerAtIndex:(NSUInteger)index
                           animated:(BOOL)animated
{
    NSMutableArray *viewControllers = [self.viewControllers mutableCopy];
    
    [viewControllers removeObjectAtIndex:index];
    [self setViewControllers:viewControllers
                    animated:animated];
}

- (void)removeViewControllerAnimated:(BOOL)animated
{
    NSUInteger tabIndex = [self.viewControllers count] - 1;
    
    [self removeViewControllerAtIndex:tabIndex
                             animated:animated];
}

@end
