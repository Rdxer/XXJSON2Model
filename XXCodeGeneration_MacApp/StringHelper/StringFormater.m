//
//  StringFormater.m
//  XcodePluginDemo
//
//  Created by LXF on 16/1/3.
//  Copyright © 2016年 LXF. All rights reserved.
//

#import "StringFormater.h"
#import "TextCheckingResult.h"

@interface StringFormater ()

@property (nonatomic, strong) NSRegularExpression *regular;

@property (nonatomic, strong) NSError *error;

@end

@implementation StringFormater

- (instancetype)initWithRegularPattern:(NSString *)pattern{
    // @"@property (.*?) (\\w*?) \\*(\\w*?);"
    self = [super init];
    if (self) {
        NSError *error = nil;
        _regular = [[NSRegularExpression alloc] initWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:&error];
        self.error = error;
        
    }
    return self;
}

-(void)matchesString:(NSString *)string completed:(void (^)(NSArray<TextCheckingResult *> *results,NSError *error))completed
{
    if (self.error) {
        completed(nil,[NSError errorWithDomain:@"正则表达式不正确." code:-10000 userInfo:@{@"error":self.error}]);
        return;
    }
    
    if (string.length <= 0) {
        completed(nil,[NSError errorWithDomain:@"不能匹配空字符串." code:-10000 userInfo:@{}]);
        return;
    }
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        NSMutableArray<TextCheckingResult *> *arrayM = [NSMutableArray array];
        
        NSArray<NSTextCheckingResult *> *matches = [self.regular matchesInString:string options:NSMatchingReportProgress range:NSMakeRange(0, string.length)];
        
        for (NSTextCheckingResult *result in matches) {
            [arrayM addObject:[TextCheckingResult textResultWithCheckingResult:result byString:string]];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completed(arrayM,nil);
        });
    });
}



@end
