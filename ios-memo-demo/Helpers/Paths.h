//
//  Paths.h
//  ios-memo-demo
//
//  Created by OkuderaYuki on 2017/12/16.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

@import Foundation;

@interface Paths : NSObject

/// DocumentsディレクトリのPATH
+ (NSString *)documentsDirectory;

/// DBファイルのPATH
+ (NSString *)dbPath;
@end
