//
//  TextCheckingResult.m
//  NSRegularExpressionDemo_Cocao
//
//  Created by LXF on 16/1/3.
//  Copyright © 2016年 LXF. All rights reserved.
//

#import "TextCheckingResult.h"
#import "OCProperty.h"

@implementation TextCheckingResult

+(instancetype)textResultWithCheckingResult:(NSTextCheckingResult *)checkResult byString:(NSString *)str{
    TextCheckingResult *textResult = [[self alloc]init];
    
    NSInteger count = checkResult.numberOfRanges;
    
    OCProperty *p = [[OCProperty alloc]init];
    
    for (int i = 0; i < count; i++) {
        NSRange range = [checkResult rangeAtIndex:i];
        NSString *resultStr = [str substringWithRange:range];
        
        if (i == 0) {
            textResult.fullString = resultStr;
        }else{
            [textResult.subStrings addObject:resultStr];
        }
        
        if (i == pName_Index_NSTextCheckingResult) {
            p.name = resultStr;
        }
        
        if (i == pType_Index_NSTextCheckingResult) {
            p.type = resultStr;
        }
    }
    
    textResult.property = p;
    
    return textResult;
}

-(NSMutableArray *)subStrings{
    if (_subStrings == nil) {
        _subStrings = [[NSMutableArray alloc] init];
    }
    return _subStrings;
}

-(NSString *)description{
    NSMutableString *string = [NSMutableString string];
    [string appendString:self.fullString];
    [string appendString:@"\n"];
    for (int i = 0; i < self.subStrings.count; i++) {
        [string appendFormat:@"<%zd> %@",i + 1,self.subStrings[i]];
        [string appendString:@"\n"];
    }
    return string;
}


@end
