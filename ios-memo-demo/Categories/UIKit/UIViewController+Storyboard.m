//
//  UIViewController+Storyboard.m
//  ios-memo-demo
//
//  Created by OkuderaYuki on 2017/12/16.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

#import "UIViewController+Storyboard.h"

@implementation UIViewController (Storyboard)

+ (__kindof UIViewController *)initialViewControllerWithStoryboardName:(NSString *)storyboardName {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    return [storyboard instantiateInitialViewController];
}

@end
