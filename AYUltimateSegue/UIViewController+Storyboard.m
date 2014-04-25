//
//  UIViewController+Storyboard.m
//  AYUltimateSegue
//
//  Created by Andrey Yastrebov on 23.04.14.
//  Copyright (c) 2014 AYastrebov. All rights reserved.
//

#import "UIViewController+Storyboard.h"
#import <objc/message.h>

#define IPAD UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad

@implementation UIViewController (Storyboard)

#pragma mark - Magic

+ (void)load
{
    method_exchangeImplementations(class_getInstanceMethod(self, @selector(prepareForSegue:sender:)), class_getInstanceMethod(self, @selector(prepareForSegueCategoryOverride:sender:)));
}

- (void)prepareForSegueCategoryOverride:(UIStoryboardSegue *)segue
                                 sender:(id)sender
{
    NSString *selectorString = [NSString stringWithFormat:@"%@:sender:", [segue identifier]];
    
    SEL selector = NSSelectorFromString(selectorString);
    if (![self respondsToSelector:selector])
    {
        return;
    }
    
    ((void(*)(id, SEL, UIStoryboardSegue *, id))objc_msgSend)(self, selector, segue, sender);
}

#pragma mark - TabBar

- (void)insertViewControllerWithIdentifier:(NSString *)identifier
                                storyboard:(NSString *)storyboardName
                          tabBarController:(UITabBarController *)tabBarController
                                    sender:(id)sender
{
    if (tabBarController)
    {
        NSUInteger tabIndex = [tabBarController.viewControllers count];
        
        [self insertViewControllerWithIdentifier:identifier
                                      storyboard:storyboardName
                                tabBarController:tabBarController
                                        tabIndex:tabIndex
                                          sender:sender];
    }
}

- (void)insertViewControllerWithIdentifier:(NSString *)identifier
                                storyboard:(NSString *)storyboardName
                          tabBarController:(UITabBarController *)tabBarController
                                  tabIndex:(NSUInteger)tabIndex
                                    sender:(id)sender
{
    UIViewController *viewController = [self viewControllerForSegueWithIdentifier:identifier
                                                                       storyboard:storyboardName
                                                                           sender:sender];
    if (tabBarController)
    {
        NSMutableArray *viewControllers = [tabBarController.viewControllers mutableCopy];
        
        if (!viewControllers)
        {
            viewControllers = [NSMutableArray array];
        }
        
        [viewControllers insertObject:viewController atIndex:tabIndex];
        [tabBarController setViewControllers:viewControllers
                                    animated:[sender boolValue]];
    }
}

#pragma mark - Push

- (void)performPushSegueWithIdentifier:(NSString *)identifier
                            storyboard:(NSString *)storyboardName
                                sender:(id)sender
{
    UIViewController *viewController = [self viewControllerForSegueWithIdentifier:identifier
                                                                       storyboard:storyboardName
                                                                           sender:sender];
    
    [self.navigationController pushViewController:viewController
                                         animated:YES];
}

#pragma mark - Modal

- (void)performModalSegueWithIdentifier:(NSString *)identifier
                             storyboard:(NSString *)storyboardName
                                 sender:(id)sender
                             completion:(void (^)(void))completion
{
    [self performModalSegueWithIdentifier:identifier
                               storyboard:storyboardName
                                   sender:sender
                          transitionStyle:0
                        presentationStyle:0
                               completion:completion];
}


- (void)performModalSegueWithIdentifier:(NSString *)identifier
                             storyboard:(NSString *)storyboardName
                                 sender:(id)sender
                        transitionStyle:(UIModalTransitionStyle)transitionStyle
                      presentationStyle:(UIModalPresentationStyle)presentationStyle
                             completion:(void (^)(void))completion
{
    UIViewController *viewController = [self viewControllerForSegueWithIdentifier:identifier
                                                                       storyboard:storyboardName
                                                                           sender:sender];
    
    viewController.modalPresentationStyle = presentationStyle;
    viewController.modalTransitionStyle = transitionStyle;
    
    [self presentViewController:viewController
                       animated:YES
                     completion:completion];
}

- (void)performModalEmbededSegueWithIdentifier:(NSString *)identifier
                                    storyboard:(NSString *)storyboardName
                                        sender:(id)sender
                                    completion:(void (^)(void))completion
{
    [self performModalEmbededSegueWithIdentifier:identifier
                                      storyboard:storyboardName
                                          sender:sender
                                 transitionStyle:0
                               presentationStyle:0
                                      completion:completion];
}

- (void)performModalEmbededSegueWithIdentifier:(NSString *)identifier
                                    storyboard:(NSString *)storyboardName
                                        sender:(id)sender
                               transitionStyle:(UIModalTransitionStyle)transitionStyle
                             presentationStyle:(UIModalPresentationStyle)presentationStyle
                                    completion:(void (^)(void))completion
{
    UINavigationController *viewController = [self viewControllerEmbededForSegueWithIdentifier:identifier
                                                                                    storyboard:storyboardName
                                                                                        sender:sender];
    
    viewController.modalPresentationStyle = presentationStyle;
    viewController.modalTransitionStyle = transitionStyle;
    
    [self presentViewController:viewController
                       animated:YES
                     completion:completion];
}

#pragma mark - Helpers

- (UINavigationController *)viewControllerEmbededForSegueWithIdentifier:(NSString *)identifier
                                                             storyboard:(NSString *)storyboardName
                                                                 sender:(id)sender
{
    UIViewController *viewController = [self viewControllerForSegueWithIdentifier:identifier
                                                                       storyboard:storyboardName
                                                                           sender:sender];
    
    if ([viewController isKindOfClass:[UINavigationController class]])
    {
        return (UINavigationController *)viewController;
    }
    
    return [[UINavigationController alloc] initWithRootViewController:viewController];
}

- (UIViewController *)viewControllerForSegueWithIdentifier:(NSString *)identifier
                                                storyboard:(NSString *)storyboardName
                                                    sender:(id)sender
{
    if (IPAD)
    {
        // iPad
        storyboardName = [storyboardName stringByAppendingString:@"_iPad"];
    }
    else
    {
        // iPhone / iPod Touch
        storyboardName = [storyboardName stringByAppendingString:@"_iPhone"];
    }
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName
                                                         bundle:[NSBundle mainBundle]];
    
    UIViewController *viewController = [storyboard instantiateInitialViewController];
    
    UIStoryboardSegue *segue = [[UIStoryboardSegue alloc] initWithIdentifier:identifier
                                                                      source:self
                                                                 destination:viewController];
    [self prepareForSegue:segue
                   sender:sender];
    
    return viewController;
}

@end
