//
//  XLazySettings.m
//  XcodePluginDemo
//
//  Created by LXF on 16/1/3.
//  Copyright © 2016年 LXF. All rights reserved.
//

#import "XLazySettings.h"

NSString *const regularText_Default = default_NSRegularExpression_Pattern;
NSString *const formatString_Default = default_FormatString;

NSString *const kXLazyRegularText = @"com.rdxer.XLazy.regularText";
NSString *const kXLazyFormatString = @"com.rdxer.XLazy.formatString";
//NSString *const kXLazyRegularText = @"com.rdxer.XLazy.regularText";

@interface XLazySettings ()

@end

@implementation XLazySettings

+(instancetype)lazySettings{
    static XLazySettings *settings = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        settings = [[XLazySettings alloc]init];
    });
    return settings;
}

-(void)reset{
    self.regularText = regularText_Default;
//    self setFormatString:<#(NSString *)#> withType:<#(NSString *)#>
}

-(NSString *)regularText{
    NSString *s = [[NSUserDefaults standardUserDefaults]objectForKey:kXLazyRegularText];
    if (s.length == 0) {
        s = regularText_Default;
    }
    return s;
}

-(void)setRegularText:(NSString *)regularText{
    if (regularText.length == 0) {
        [[NSUserDefaults standardUserDefaults]setObject:regularText_Default forKey:kXLazyRegularText];
    }else{
        [[NSUserDefaults standardUserDefaults]setObject:regularText forKey:kXLazyRegularText];
    }
}

#warning 待添加功能

-(NSString *)formatStringWithType:(NSString *)type{
//    NSDictionary *dict = [[NSUserDefaults standardUserDefaults]objectForKey:kXLazyFormatString];
//    if (dict.count == 0 || type.length == 0 || dict[type] == nil || [dict[type] length] == 0) {
        return formatString_Default;
//    }
//    return dict[type];
}

-(void)setFormatString:(NSString *)string withType:(NSString *)type{
    
}

@end
