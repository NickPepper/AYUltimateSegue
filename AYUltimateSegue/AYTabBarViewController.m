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

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {        
        [self insertViewControllerWithIdentifier:@"tabBarToFirstSegue"
                                      storyboard:@"AYFirstStoryboard"
                                tabBarController:self
                                          sender:@(NO)];
        
        [self insertViewControllerWithIdentifier:@"tabBarToSecondSegue"
                                      storyboard:@"AYSecondStoryboard"
                                tabBarController:self
                                          sender:@(NO)];
        
        [self insertViewControllerWithIdentifier:@"tabBarToThirdSegue"
                                      storyboard:@"AYThirdStoryboard"
                                tabBarController:self
                                          sender:@(NO)];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
