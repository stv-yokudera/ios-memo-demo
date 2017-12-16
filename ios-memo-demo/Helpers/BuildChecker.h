//
//  BuildChecker.h
//  ios-memo-demo
//
//  Created by OkuderaYuki on 2017/12/16.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

@import Foundation;

@interface BuildChecker : NSObject

/**
 XCTest実行中かどうかチェックする

 @return true: XCTest実行中, false: XCTest実行中でない
 */
+ (BOOL) isTesting;
@end
