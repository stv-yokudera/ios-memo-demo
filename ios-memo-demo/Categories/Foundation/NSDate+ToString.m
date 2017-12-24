//
//  NSDate+ToString.m
//  ios-memo-demo
//
//  Created by OkuderaYuki on 2017/12/24.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

#import "NSDate+ToString.h"

@implementation NSDate (ToString)

- (NSString *)toStringWithFormat:(NSString *)dateFormat {

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = dateFormat;
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    
    return [dateFormatter stringFromDate:self];
}
@end
