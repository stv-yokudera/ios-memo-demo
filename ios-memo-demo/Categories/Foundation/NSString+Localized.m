//
//  NSString+Localized.m
//  ios-memo-demo
//
//  Created by OkuderaYuki on 2017/12/16.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

#import "NSString+Localized.h"

@implementation NSString (Localized)
- (NSString *)localized {
    return NSLocalizedString(self, @"");
}
@end
