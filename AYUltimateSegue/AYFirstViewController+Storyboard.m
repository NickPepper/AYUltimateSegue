//
//  AYFirstViewController+Storyboard.m
//  AYUltimateSegue
//
//  Created by Andrey Yastrebov on 24.04.14.
//  Copyright (c) 2014 AYastrebov. All rights reserved.
//

#import "AYFirstViewController+Storyboard.h"

#import "AYSecondViewController.h"
#import "AYThirdViewController.h"
#import "AYDistinctViewController.h"

@implementation AYFirstViewController (Storyboard)

- (void)firstToSecondSegue:(UIStoryboardSegue *)segue
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

- (void)firstToThirdSegue:(UIStoryboardSegue *)segue
                   sender:(id)sender
{
    // Do any additional setup.
    UINavigationController *navigationController = [segue destinationViewController];
    
    UIBarButtonItem *dismissButton = [[UIBarButtonItem alloc] initWithTitle:@"Dismiss"
                                                                      style:UIBarButtonItemStyleBordered
                                                                     target:self
                                                                     action:@selector(dismiss:)];
    
    AYThirdViewController *viewController = (AYThirdViewController *)[navigationController topViewController];
    viewController.title = @"Modal Third";
    viewController.navigationItem.leftBarButtonItem = dismissButton;
}

- (void)firstToDistinctSegue:(UIStoryboardSegue *)segue
                      sender:(id)sender
{
    // Do any additional setup.
    AYDistinctViewController *viewController = [segue destinationViewController];
    
    UIBarButtonItem *dismissButton = [[UIBarButtonItem alloc] initWithTitle:@"Dismiss"
                                                                      style:UIBarButtonItemStyleBordered
                                                                     target:self
                                                                     action:@selector(dismiss:)];
    
    viewController.title = @"Modal Distinct";
    viewController.navigationItem.leftBarButtonItem = dismissButton;
}

- (void)dismiss:(id)sender
{
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}

@end
