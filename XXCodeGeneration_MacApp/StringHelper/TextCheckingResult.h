//
//  TextCheckingResult.h
//  NSRegularExpressionDemo_Cocao
//
//  Created by LXF on 16/1/3.
//  Copyright © 2016年 LXF. All rights reserved.
//

#import <Foundation/Foundation.h>

@class OCProperty;


@interface TextCheckingResult : NSObject

@property (nonatomic, copy) NSString *fullString;

@property (nonatomic, strong) NSMutableArray<NSString *> *subStrings;

@property (nonatomic, strong) OCProperty *property;

+(instancetype)textResultWithCheckingResult:(NSTextCheckingResult *)checkResult byString:(NSString *)str;

@end
