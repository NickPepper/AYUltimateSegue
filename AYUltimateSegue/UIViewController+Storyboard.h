//
//  UIViewController+Storyboard.h
//  AYUltimateSegue
//
//  Created by Andrey Yastrebov on 23.04.14.
//  Copyright (c) 2014 AYastrebov. All rights reserved.
//


@interface UIViewController (Storyboard)

- (void)performTabSegueWithIdentifier:(NSString *)identifier
                           storyboard:(NSString *)storyboardName
                             tabIndex:(NSUInteger)tabIndex
                               sender:(id)sender;

- (void)performPushSegueWithIdentifier:(NSString *)identifier
                            storyboard:(NSString *)storyboardName
                                sender:(id)sender;

- (void)performModalSegueWithIdentifier:(NSString *)identifier
                             storyboard:(NSString *)storyboardName
                                 sender:(id)sender;

- (void)performModalSegueWithIdentifier:(NSString *)identifier
                             storyboard:(NSString *)storyboardName
                                 sender:(id)sender
                                  style:(UIModalPresentationStyle)style;

@end
