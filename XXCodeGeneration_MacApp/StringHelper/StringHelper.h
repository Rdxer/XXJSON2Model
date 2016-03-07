//
//  StringHelper.h
//  XcodePluginDemo
//
//  Created by LXF on 16/1/3.
//  Copyright © 2016年 LXF. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TextCheckingResult;

@interface StringHelper : NSObject

+(NSString *)makeLazyCode:(NSArray<TextCheckingResult *> *)results;

@end
