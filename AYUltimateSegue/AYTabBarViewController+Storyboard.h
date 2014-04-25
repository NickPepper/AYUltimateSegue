//
//  AYTabBarViewController+Storyboard.h
//  AYUltimateSegue
//
//  Created by Andrey Yastrebov on 24.04.14.
//  Copyright (c) 2014 AYastrebov. All rights reserved.
//

#import "AYTabBarViewController.h"

@interface AYTabBarViewController (Storyboard)

- (void)removeViewControllerAnimated:(BOOL)animated;

- (void)removeViewControllerAtIndex:(NSUInteger)index
                           animated:(BOOL)animated;

@end
