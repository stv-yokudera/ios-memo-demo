//
//  NSString+ToDate.h
//  ios-memo-demo
//
//  Created by OkuderaYuki on 2017/12/24.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

@import Foundation;

@interface NSString (ToDate)
- (NSDate *)toDateWithFormat:(NSString *)dateFormat;
@end
