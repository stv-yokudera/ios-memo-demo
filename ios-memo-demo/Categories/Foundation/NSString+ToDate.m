//
//  NSString+ToDate.m
//  ios-memo-demo
//
//  Created by OkuderaYuki on 2017/12/24.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

#import "NSString+ToDate.h"

@implementation NSString (ToDate)

- (NSDate *)toDateWithFormat:(NSString *)dateFormat {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = dateFormat;
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];

    return [dateFormatter dateFromString:self];
}
@end
