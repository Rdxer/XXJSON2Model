//
//  OCClass.h
//  XXCodeGeneration_MacApp
//
//  Created by LXF on 16/2/3.
//  Copyright © 2016年 LXF. All rights reserved.
//

#import <Foundation/Foundation.h>

@class OCProperty;

@interface OCClass : NSObject

@property (nonatomic, copy) NSString *clazzName;
@property (nonatomic, strong) NSMutableArray<OCProperty *> *propertyArray;

+(instancetype)classWithModelDict:(NSDictionary *)dict;

-(NSString *)makeInterfaceCode;


@end
