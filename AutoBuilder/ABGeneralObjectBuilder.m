//
//  ABGeneralObjectBuilder.m
//  AutoBuilder
//
//  Created by ltryee on 15/11/2.
//  Copyright © 2015年 com.AutoBuilder. All rights reserved.
//

#import "ABGeneralObjectBuilder.h"

@implementation ABGeneralObjectBuilder

+ (Class)objectClass
{
    NSString *selfClassString = NSStringFromClass([self class]);
    NSString *objectClassString = [selfClassString substringToIndex:selfClassString.length - 7];
    return NSClassFromString(objectClassString);
}

+ (id)builder
{
    return [[[self class] alloc] init];
}

+ (id)builderWithOjbectClass:(Class)cls
{
    ABGeneralObjectBuilder *builder = [[[self class] alloc] init];
    builder.objectCls = cls;
    return builder;
}

- (id)buildWithClass:(Class)objectClass
{
    id object = nil;
    if ([objectClass superclass] != [NSObject class]) {
        object = [self buildWithClass:[objectClass superclass]];
    }
    else {
        object = [[self.objectCls alloc] init];
    }
    
    unsigned int outCount;
    objc_property_t *properties = class_copyPropertyList(objectClass, &outCount);
    for (unsigned int i = 0; i < outCount; ++i) {
        NSString *strName = [NSString stringWithCString:property_getName(properties[i])
                                               encoding:NSUTF8StringEncoding];
        id propertyValue = [self objectForKey:strName];
        if (propertyValue) {
            [object setValue:propertyValue forKey:strName];
        }
    }
    
    // release properties
    free(properties);
    
    return object;
}

- (id)build
{
    return [self buildWithClass:self.objectCls];
}

@end
