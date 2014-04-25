//
//  AYSecondViewController.m
//  AYUltimateSegue
//
//  Created by Andrey Yastrebov on 23.04.14.
//  Copyright (c) 2014 AYastrebov. All rights reserved.
//

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
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addVCToTabBar:(id)sender {
}

- (IBAction)removeVCFromTabBAr:(id)sender {
}

@end
