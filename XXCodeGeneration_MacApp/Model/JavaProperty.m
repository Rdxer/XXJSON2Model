//
//  JavaProperty.m
//  XXCodeGeneration_MacApp
//
//  Created by LXF on 16/6/8.
//  Copyright © 2016年 LXF. All rights reserved.
//

#import "JavaProperty.h"

@implementation JavaProperty

-(NSString *)makePropertyCode{
    
    NSString *result = nil;
    
    NSString *stringFormat = @"private %@ %@;";
    
    result = [NSString stringWithFormat:stringFormat,self.type,self.name];
    return result;
}

@end
