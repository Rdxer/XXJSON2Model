//
//  OCClass.m
//  XXCodeGeneration_MacApp
//
//  Created by LXF on 16/2/3.
//  Copyright © 2016年 LXF. All rights reserved.
//

#import "OCClass.h"
#import "OCProperty.h"

@implementation OCClass

+(instancetype)classWithModelDict:(NSDictionary *)dict{
    OCClass *clazz = [[self alloc]init];
    
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        OCProperty *p = [[OCProperty alloc]init];
        p.name = key;
        if (obj == nil) {
            p.type = @"<#NSString#> *";
        }else if([obj isKindOfClass:[NSString class]]){
            p.type = @"NSString *";
        }else if([obj isKindOfClass:[NSNumber class]]){
            p.type = @"NSInteger ";
        }else {
            p.type = @"<#NSString#> *";
        }
        [clazz.propertyArray addObject:p];
    }];
    
    return clazz;
}

-(NSString *)makeInterfaceCode{
    NSMutableString *string = [NSMutableString string];
    
    for (OCProperty *p in self.propertyArray) {
        [string appendString:p.makePropertyCode];
        [string appendString:@"\n"];
    }
    
    return string;
}

-(NSMutableArray<OCProperty *> *)propertyArray{
    if (_propertyArray == nil) {
        NSMutableArray<OCProperty *> *a = [[NSMutableArray<OCProperty *> alloc] init];
        _propertyArray = a;
    }
    return _propertyArray;
}


@end
