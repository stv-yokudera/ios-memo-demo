//
//  BuildChecker.m
//  ios-memo-demo
//
//  Created by OkuderaYuki on 2017/12/16.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

#import "BuildChecker.h"

@implementation BuildChecker

+ (BOOL) isTesting {
    NSDictionary *environment = NSProcessInfo.processInfo.environment;
    return environment[@"XCTestConfigurationFilePath"] != nil;
}

@end
