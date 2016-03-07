//
//  StringHelper.m
//  XcodePluginDemo
//
//  Created by LXF on 16/1/3.
//  Copyright © 2016年 LXF. All rights reserved.
//

#import "StringHelper.h"
#import "OCProperty.h"
#import "TextCheckingResult.h"

@implementation StringHelper

+(NSString *)makeLazyCode:(NSArray<TextCheckingResult *> *)results{
    NSMutableString *stringP = [NSMutableString string];
    for (TextCheckingResult *result in results) {
        [stringP appendString:[result.property makeOCLazyCode]];
    }
    return stringP;
}

@end
