//
//  AYThirdViewController.m
//  AYUltimateSegue
//
//  Created by Andrey Yastrebov on 24.04.14.
//  Copyright (c) 2014 AYastrebov. All rights reserved.
//

#import "AYThirdViewController.h"

@interface AYThirdViewController ()

@end

@implementation AYThirdViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushToFirst:(id)sender
{
    [self performPushSegueWithIdentifier:@"thirdToFirstSegue"
                              storyboard:@"AYFirstStoryboard"
                                  sender:nil];
}

- (IBAction)pushToSecond:(id)sender
{
    [self performPushSegueWithIdentifier:@"thirdToSecondSegue"
                              storyboard:@"AYSecondStoryboard"
                                  sender:nil];
}

- (IBAction)pushToDistinct:(id)sender
{
    [self performPushSegueWithIdentifier:@"thirdToDistinctSegue"
                              storyboard:@"AYDistinctStoryboard"
                                  sender:nil];
}

@end
