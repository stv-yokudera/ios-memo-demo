//
//  NSDate+Style.m
//  ios-memo-demo
//
//  Created by OkuderaYuki on 2017/12/16.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

#import "NSDate+Style.h"

@implementation NSDate (Style)
- (NSString *)dateStyle {

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ja_JP"];
    formatter.timeStyle = NSDateFormatterShortStyle;
    formatter.dateStyle = NSDateFormatterShortStyle;
    formatter.dateFormat = @"yyyy/MM/dd HH:mm:ss";
    NSDate *now = [formatter dateFromString:[formatter stringFromDate:[NSDate date]]];

    NSCalendar *calendar = [NSCalendar currentCalendar];

    NSCalendarUnit unitFlags = NSCalendarUnitYear |
    NSCalendarUnitMonth |
    NSCalendarUnitDay |
    NSCalendarUnitHour |
    NSCalendarUnitMinute;

    NSDateComponents *components = [calendar components:unitFlags
                                               fromDate:self];

    NSInteger year = components.year;
    NSInteger month = components.month;
    NSInteger day = components.day;
    NSInteger hour = components.hour;
    NSInteger minite = components.minute;

    BOOL yearAreEqual = [calendar isDate:now equalToDate:self toUnitGranularity:NSCalendarUnitYear];

    // 年が異なるかどうか
    if (!yearAreEqual) {
        return [NSString stringWithFormat:@"%04d/%02d/%02d", (int)year, (int)month, (int)day];
    }

    BOOL dateAreEqual = [calendar isDate:now equalToDate:self toUnitGranularity:NSCalendarUnitDay];

    // 日が異なるかどうか
    if (!dateAreEqual) {
        return [NSString stringWithFormat:@"%02d/%02d", (int)month, (int)day];
    }
    return [NSString stringWithFormat:@"%02d:%02d", (int)hour, (int)minite];
}

@end
