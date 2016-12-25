//
//  JavaClass.m
//  XXCodeGeneration_MacApp
//
//  Created by LXF on 16/6/8.
//  Copyright © 2016年 LXF. All rights reserved.
//

#import "JavaClass.h"
#import "OCProperty.h"
#import "JavaProperty.h"

@implementation JavaClass

+(instancetype)classWithModelDict:(NSDictionary *)dict{
    JavaClass *clazz = [[self alloc]init];
    
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        JavaProperty *p = [[JavaProperty alloc]init];
        p.name = key;
        if (obj == nil) {
            p.type = @"String";
        }else if([obj isKindOfClass:[NSString class]]){
            p.type = @"String";
        }else if([obj isKindOfClass:[NSNumber class]]){
            
            int intv = [obj intValue];
            double douv = [obj doubleValue];
            if (douv - intv < 0.0000001) {
                
                p.type = @"int";
            }else{
                p.type = @"double";
            }
        }else {
            p.type = @"String";
        }
        [clazz.propertyArray addObject:p];
    }];
    
    return clazz;
}
@end
