//
//  Paths.m
//  ios-memo-demo
//
//  Created by OkuderaYuki on 2017/12/16.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

#import "BuildChecker.h"
#import "Paths.h"

@implementation Paths

+ (NSString *)documentsDirectory {
    return NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
}

+ (NSString *)dbPath {

    if ([BuildChecker isTesting]) {
        return [self.documentsDirectory stringByAppendingPathComponent:@"unittest.db"];
    }
    return [self.documentsDirectory stringByAppendingPathComponent:@"product.db"];
}

@end
