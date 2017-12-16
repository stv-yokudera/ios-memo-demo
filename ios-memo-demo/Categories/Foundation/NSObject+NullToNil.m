//
//  NSObject+NullToNil.m
//  ios-memo-demo
//
//  Created by OkuderaYuki on 2017/12/16.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

#import "NSObject+NullToNil.h"

@implementation NSObject (NullToNil)

- (__kindof NSObject *)nullToNil {
    return [self isEqual:[NSNull null]] ? nil : self;
}

@end
