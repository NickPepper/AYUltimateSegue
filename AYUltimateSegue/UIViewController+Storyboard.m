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

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

- (void)prepareForSegue:(UIStoryboardSegue *)segue
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


#pragma clang diagnostic pop

- (void)performTabSegueWithIdentifier:(NSString *)identifier
                           storyboard:(NSString *)storyboardName
                             tabIndex:(NSUInteger)tabIndex
                               sender:(id)sender
{
    UIViewController *viewController = [self viewControllerForSegueWithIdentifier:identifier
                                                                       storyboard:storyboardName
                                                                           sender:sender];
    
    if ([self respondsToSelector:@selector(viewControllers)] && [self isKindOfClass:[UITabBarController class]])
    {
        UITabBarController *tbController = (UITabBarController *)self;
        
        NSMutableArray *viewControllers = [tbController.viewControllers mutableCopy];
        
        if (!viewControllers)
        {
            viewControllers = [NSMutableArray array];
        }
        
        [viewControllers insertObject:viewController atIndex:tabIndex];
        [tbController setViewControllers:viewControllers];
    }
}

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


- (void)performModalSegueWithIdentifier:(NSString *)identifier
                             storyboard:(NSString *)storyboardName
                                 sender:(id)sender
                             completion:(void (^)(void))completion
{
    UIViewController *viewController = [self viewControllerForSegueWithIdentifier:identifier
                                                                       storyboard:storyboardName
                                                                           sender:sender];
    
    [self.navigationController presentViewController:viewController
                                            animated:YES
                                          completion:completion];
}


- (void)performModalSegueWithIdentifier:(NSString *)identifier
                             storyboard:(NSString *)storyboardName
                                 sender:(id)sender
                                  style:(UIModalPresentationStyle)style
                             completion:(void (^)(void))completion
{
    UIViewController *viewController = [self viewControllerForSegueWithIdentifier:identifier
                                                                       storyboard:storyboardName
                                                                           sender:sender];
    
    viewController.modalPresentationStyle = style;
    
    [self.navigationController presentViewController:viewController
                                            animated:YES
                                          completion:completion];
}

#pragma mark - Helpers

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
