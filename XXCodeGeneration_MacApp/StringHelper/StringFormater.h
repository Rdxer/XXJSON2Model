//
//  StringFormater.h
//  XcodePluginDemo
//
//  Created by LXF on 16/1/3.
//  Copyright © 2016年 LXF. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TextCheckingResult;

@interface StringFormater : NSObject

- (instancetype)initWithRegularPattern:(NSString *)pattern;

-(void)matchesString:(NSString *)string completed:(void (^)(NSArray<TextCheckingResult *> *results,NSError *error))completed;

@end
