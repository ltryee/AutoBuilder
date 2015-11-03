//
//  main.m
//  AutoBuilder
//
//  Created by ltryee on 15/11/2.
//  Copyright © 2015年 com.AutoBuilder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "NSObject+ABObjectBuilder.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *person = [Person createObjectWithBuilderBlock:^(ABGeneralObjectBuilder *builder) {
            builder[@"name"] = @"vector";
            builder[@"age"] = @(30);
        }];
        
        ABLog(@"%@, %lld", person.name, (long long)person.age);
        
        Student *student = [Student createObjectWithBuilderBlock:^(ABGeneralObjectBuilder *builder) {
            builder[@"name"] = @"vector";
            builder[@"age"] = @(30);
            builder[@"school"] = @"HIT";
        }];
        
        ABLog(@"%@, %lld, %@", student.name, (long long)student.age, student.school);
    }
    return 0;
}
