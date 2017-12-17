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

    NSString *dbName = [BuildChecker isTesting] ? @"unittest.db" : @"product.db";
    return [self.documentsDirectory stringByAppendingPathComponent:dbName];
}

@end
