//
//  AYFirstViewController.m
//  AYUltimateSegue
//
//  Created by Andrey Yastrebov on 23.04.14.
//  Copyright (c) 2014 AYastrebov. All rights reserved.
//

#import "AYFirstViewController.h"
#import "AYFirstViewController+Storyboard.h"

@interface AYFirstViewController ()

@end

@implementation AYFirstViewController

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

- (IBAction)presentSecond:(id)sender
{
    [self performModalSegueWithIdentifier:@"firstToSecondSegue"
                               storyboard:@"AYSecondStoryboard"
                                   sender:nil
                          transitionStyle:UIModalTransitionStylePartialCurl
                        presentationStyle:UIModalPresentationFullScreen
                               completion:^{
                                   NSLog(@"Did presented Second Tab");
                               }];
}

- (IBAction)presentThird:(id)sender
{
    [self performModalSegueWithIdentifier:@"firstToThirdSegue"
                               storyboard:@"AYThirdStoryboard"
                                   sender:nil
                               completion:^{
                                   NSLog(@"Did presented Third Tab");
                               }];
}

- (IBAction)presentDistinct:(id)sender
{
    [self performModalEmbededSegueWithIdentifier:@"firstToDistinctSegue"
                                      storyboard:@"AYDistinctStoryboard"
                                          sender:nil
                                      completion:^{
                                          NSLog(@"Did presented Distinct VC");
                                      }];
}

@end
