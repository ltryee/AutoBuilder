//
//  NSObject+ABObjectBuilder.h
//  AutoBuilder
//
//  Created by ltryee on 15/11/3.
//  Copyright © 2015年 com.AutoBuilder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ABGeneralObjectBuilder.h"

@interface NSObject (ABObjectBuilder)

+ (instancetype)createObjectWithBuilderBlock:(void (^)(ABGeneralObjectBuilder *))block;

@end
