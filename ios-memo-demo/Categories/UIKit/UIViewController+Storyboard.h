//
//  UIViewController+Storyboard.h
//  ios-memo-demo
//
//  Created by OkuderaYuki on 2017/12/16.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

@import UIKit;

@interface UIViewController (Storyboard)
+ (UIViewController *)initialViewControllerWithStoryboardName:(NSString *)storyboardName;
@end
