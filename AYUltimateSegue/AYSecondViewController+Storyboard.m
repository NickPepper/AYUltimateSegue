//
//  AYSecondViewController+Storyboard.m
//  AYUltimateSegue
//
//  Created by Andrey Yastrebov on 24.04.14.
//  Copyright (c) 2014 AYastrebov. All rights reserved.
//

#import "AYSecondViewController+Storyboard.h"

#import "AYDistinctViewController.h"

@implementation AYSecondViewController (Storyboard)

- (void)insertDistinctSegue:(UIStoryboardSegue *)segue
                     sender:(id)sender
{
    AYDistinctViewController *viewController = [segue destinationViewController];
    viewController.tabBarItem.title = [NSString stringWithFormat:@"Distinct-%d", self.tabBarController.viewControllers.count - 3];
}

@end
