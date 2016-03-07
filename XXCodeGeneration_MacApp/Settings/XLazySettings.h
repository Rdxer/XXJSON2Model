//
//  XLazySettings.h
//  XcodePluginDemo
//
//  Created by LXF on 16/1/3.
//  Copyright © 2016年 LXF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XLazySettings : NSObject

+(instancetype)lazySettings;


@property (nonatomic, copy) NSString *regularText;

-(void)reset;

-(NSString *)formatStringWithType:(NSString *)type;
-(void)setFormatString:(NSString *)string withType:(NSString *)type;

@end
