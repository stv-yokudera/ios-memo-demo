//
//  NSDate+ToString.h
//  ios-memo-demo
//
//  Created by OkuderaYuki on 2017/12/24.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

@import Foundation;

@interface NSDate (ToString)
- (NSString *)toStringWithFormat:(NSString *)dateFormat;
@end
