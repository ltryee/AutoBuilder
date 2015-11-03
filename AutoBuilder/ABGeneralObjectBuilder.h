//
//  ABGeneralObjectBuilder.h
//  AutoBuilder
//
//  Created by ltryee on 15/11/2.
//  Copyright © 2015年 com.AutoBuilder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OrderedDictionary.h"
#import <objc/runtime.h>

//#ifdef __DEBUG__
#define ABLog(xx, ...) NSLog(@"%s(%d): " xx, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
//#else
//#define ABLog(xx, ...)
//#endif

@interface ABGeneralObjectBuilder : MutableOrderedDictionary

@property (nonatomic, strong)Class objectCls;

+ (Class)objectClass;

+ (id)builderWithOjbectClass:(Class)cls;

- (id)build;

@end
