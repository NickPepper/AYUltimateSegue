//
//  AYSecondViewController.m
//  AYUltimateSegue
//
//  Created by Andrey Yastrebov on 23.04.14.
//  Copyright (c) 2014 AYastrebov. All rights reserved.
//

#import "AYTabBarViewController+Storyboard.h"

#import "AYSecondViewController.h"
#import "AYSecondViewController+Storyboard.h"

@interface AYSecondViewController ()
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UIButton *removeButton;
@end

@implementation AYSecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.removeButton setEnabled:NO];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addVCToTabBar:(id)sender
{
    [self insertViewControllerWithIdentifier:@"insertDistinctSegue"
                                  storyboard:@"AYDistinctStoryboard"
                            tabBarController:self.tabBarController
                                      sender:@(YES)];
    
    if (self.tabBarController.viewControllers.count > 3)
    {
        [self.removeButton setEnabled:YES];
    }
}

- (IBAction)removeVCFromTabBAr:(id)sender
{
    [(AYTabBarViewController *)self.tabBarController removeViewControllerAnimated:YES];
    
    if (self.tabBarController.viewControllers.count < 4)
    {
        [self.removeButton setEnabled:NO];
    }
}

@end
