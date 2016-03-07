//
//  OCProperty.h
//  NSRegularExpressionDemo_Cocao
//
//  Created by LXF on 16/1/3.
//  Copyright © 2016年 LXF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OCProperty : NSObject

///   $(pType)
@property (nonatomic, copy) NSString *type;

///   $(pName)
@property (nonatomic, copy) NSString *name;

/// 内存策略
@property (nonatomic, copy) NSString *memoryPolicy;

+(instancetype)propertyWithType:(NSString *)type name:(NSString *)name;

-(NSString *)makeOCLazyCode;

-(NSString *)makeOCPropertyCode;



@end
