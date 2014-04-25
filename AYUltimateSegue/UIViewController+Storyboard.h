//
//  UIViewController+Storyboard.h
//  AYUltimateSegue
//
//  Created by Andrey Yastrebov on 23.04.14.
//  Copyright (c) 2014 AYastrebov. All rights reserved.
//


@interface UIViewController (Storyboard)

- (void)insertViewControllerWithIdentifier:(NSString *)identifier
                                storyboard:(NSString *)storyboardName
                          tabBarController:(UITabBarController *)tabBarController
                                    sender:(id)sender;

- (void)insertViewControllerWithIdentifier:(NSString *)identifier
                                storyboard:(NSString *)storyboardName
                          tabBarController:(UITabBarController *)tabBarController
                                  tabIndex:(NSUInteger)tabIndex
                                    sender:(id)sender;

- (void)performPushSegueWithIdentifier:(NSString *)identifier
                            storyboard:(NSString *)storyboardName
                                sender:(id)sender;

- (void)performModalSegueWithIdentifier:(NSString *)identifier
                             storyboard:(NSString *)storyboardName
                                 sender:(id)sender
                             completion:(void (^)(void))completion;

- (void)performModalSegueWithIdentifier:(NSString *)identifier
                             storyboard:(NSString *)storyboardName
                                 sender:(id)sender
                        transitionStyle:(UIModalTransitionStyle)transitionStyle
                      presentationStyle:(UIModalPresentationStyle)presentationStyle
                             completion:(void (^)(void))completion;

- (void)performModalEmbededSegueWithIdentifier:(NSString *)identifier
                                    storyboard:(NSString *)storyboardName
                                        sender:(id)sender
                                    completion:(void (^)(void))completion;

- (void)performModalEmbededSegueWithIdentifier:(NSString *)identifier
                                    storyboard:(NSString *)storyboardName
                                        sender:(id)sender
                               transitionStyle:(UIModalTransitionStyle)transitionStyle
                             presentationStyle:(UIModalPresentationStyle)presentationStyle
                                    completion:(void (^)(void))completion;

@end
