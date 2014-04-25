//
//  AYThirdViewController+Storyboard.m
//  AYUltimateSegue
//
//  Created by Andrey Yastrebov on 24.04.14.
//  Copyright (c) 2014 AYastrebov. All rights reserved.
//

#import "AYThirdViewController+Storyboard.h"

#import "AYSecondViewController.h"
#import "AYFirstViewController.h"
#import "AYDistinctViewController.h"

@implementation AYThirdViewController (Storyboard)

- (void)thirdToFirstSegue:(UIStoryboardSegue *)segue
                   sender:(id)sender
{
    AYFirstViewController *viewController = [segue destinationViewController];
    viewController.title = @"Push to First";
}

- (void)thirdToSecondSegue:(UIStoryboardSegue *)segue
                    sender:(id)sender
{
    AYSecondViewController *viewController = [segue destinationViewController];
    viewController.title = @"Push to Second";
}

- (void)thirdToDistinctSegue:(UIStoryboardSegue *)segue
                      sender:(id)sender
{
    AYDistinctViewController *viewController = [segue destinationViewController];
    viewController.title = @"Push to Distinct";
}

@end
