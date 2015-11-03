//
//  NSObject+ABObjectBuilder.m
//  AutoBuilder
//
//  Created by ltryee on 15/11/3.
//  Copyright © 2015年 com.AutoBuilder. All rights reserved.
//

#import "NSObject+ABObjectBuilder.h"

@implementation NSObject (ABObjectBuilder)

+ (instancetype)createObjectWithBuilderBlock:(void (^)(ABGeneralObjectBuilder *))block
{
    ABGeneralObjectBuilder *builder = [ABGeneralObjectBuilder builderWithOjbectClass:[self class]];
    block(builder);
    return [builder build];
}

@end
